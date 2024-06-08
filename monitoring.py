from flask import request, jsonify , Blueprint
from flask_jwt_extended import get_jwt_identity, jwt_required
from auth_utils import role_required
from db import get_db # Assuming get_db is a local module providing database connection
from dateutil import parser  

monitoring_blueprint = Blueprint('monitoring', __name__)


# ==========================================  Monitoring Related Routes START =============================

# Route to get total number of monitoring dashboard
@monitoring_blueprint.route('/my_monitoring_dashboard', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5]) 
def my_monitoring_dashboard():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()
    
    cursor.execute("SELECT COUNT(ProjectMonitoringReportID) AS send_for_monitoring FROM ProjectMonitoringReport pmr INNER JOIN Projects p ON pmr.ProjectID = p.ProjectID WHERE p.CreatorUserID = %s", (current_user_id,))
    send_for_monitoring = cursor.fetchone()
    print(send_for_monitoring['send_for_monitoring'])
    
    # cursor.execute("SELECT COUNT(DISTINCT pmf.ProjectID) AS feedback_from_committee FROM ProjectMonitoringFeedback pmf INNER JOIN Projects p ON pmf.ProjectID = p.ProjectID WHERE p.CreatorUserID = %s" , (current_user_id,))
    cursor.execute("SELECT COUNT( DISTINCT ProjectMonitoringReportID) AS feedback_from_committee FROM projectmonitoringfeedback WHERE ProjectMonitoringReportID IN (SELECT ProjectMonitoringReportID FROM ProjectMonitoringReport WHERE ProjectID IN (SELECT ProjectID FROM ProjectListWithUserID WHERE UserID = %s))" , (current_user_id,))
    feedback_from_committee = cursor.fetchone()
    print(feedback_from_committee['feedback_from_committee'])
    
    cursor.execute("SELECT COUNT(DISTINCT ProjectID) as can_send_monitoring_report FROM Projects WHERE ProjectStatus = 'Approved' AND CreatorUserID = %s" , (current_user_id,))
    can_send_monitoring_report = cursor.fetchone()
    print(can_send_monitoring_report['can_send_monitoring_report'])
    
    cursor.execute("SELECT COUNT(*) AS feedback_sent FROM ProjectMonitoringFeedback WHERE MonitoringCommitteeUserID = %s AND Observation IS NOT NULL" , (current_user_id,))
    feedback_sent = cursor.fetchone()
    print(feedback_sent['feedback_sent'])
    
    cursor.execute("SELECT COUNT(*) AS no_of_report_assigned_to_me FROM ProjectMonitoringReport WHERE ProjectMonitoringReportID IN (SELECT ProjectMonitoringReportID FROM ProjectReportListWithMonitoringCommitteeID WHERE MonitoringCommitteeUserID = %s)", (current_user_id,))
    no_of_report_assigned_to_me = cursor.fetchone()
    print(no_of_report_assigned_to_me['no_of_report_assigned_to_me'])
    
    cursor.close()
    conn.close()
    
    return jsonify({
        'send_for_monitoring': send_for_monitoring['send_for_monitoring'],
        'feedback_from_committee': feedback_from_committee['feedback_from_committee'],
        'can_send_monitoring_report': can_send_monitoring_report['can_send_monitoring_report'],
        'no_of_report_assigned_to_me': no_of_report_assigned_to_me['no_of_report_assigned_to_me'],
        'feedback_sent': feedback_sent['feedback_sent'],
        'statuscode' : 200
    }) , 200


# Route to get all projects
@monitoring_blueprint.route('/get_all_myprojects_can_send_monitoring_report', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])  
def get_all_myprojects_can_send_monitoring_report():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    current_user_id = get_jwt_identity()
    
    cursor.execute("SELECT ProjectID , ProjectTitle , CodeByRTC FROM Projects WHERE ProjectStatus = 'Approved' AND CreatorUserID = %s" , (current_user_id,))
    total_project_list_can_send_monitoring_report = cursor.fetchall()
    print(total_project_list_can_send_monitoring_report)
    
    cursor.close()
    conn.close()
    
    return jsonify({'projects': total_project_list_can_send_monitoring_report  , "statuscode" : 200}) , 200



# Route to create a new fund request for a project
@monitoring_blueprint.route('/create_monitoring_request_for_specific_project', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])
def create_monitoring_request_for_specific_project():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    insert_query = "INSERT INTO ProjectMonitoringReport (ProjectID, ReportDate) VALUES (%s, %s)"
    review_data = (data['ProjectID'], data['ReportDate'])
    cursor.execute(insert_query, review_data)
    conn.commit()
    projectMonitoringReportID = cursor.lastrowid
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Advance Fund request created successfully' , 'statuscode' : 201 , 'projectMonitoringReportID' : projectMonitoringReportID}), 201


# Route to update project status & total points of specific project
@monitoring_blueprint.route('/update_project_gantt_for_report/<int:projectMonitoringReportID>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def update_project_gantt_for_report(projectMonitoringReportID):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    for activity_data in data:
        # Convert date strings to the format MySQL accepts 
        # Fri, 19 Apr 2024 00:00:00 GMT to 2024-04-19 00:00:00
        start_date = parser.parse(activity_data['StartDate']).strftime('%Y-%m-%d')
        end_date = parser.parse(activity_data['EndDate']).strftime('%Y-%m-%d')
        
        update_query = "UPDATE ActivityPlan SET Activity = %s , StartDate = %s , EndDate = %s , ActivityStatus = %s WHERE ProjectID = %s AND ActivityID = %s"
        project_data = (activity_data['Activity'], start_date, end_date, activity_data['ActivityStatus'], activity_data['ProjectID'], activity_data['ActivityID'])
        cursor.execute(update_query, project_data)
        print(activity_data)
        
        insert_query = "INSERT INTO ActivityPlanHistory (ProjectID, Activity, StartDate, EndDate, ActivityStatus) VALUES (%s, %s, %s, %s, %s)"
        user_data = (activity_data['ProjectID'], activity_data['Activity'], start_date, end_date, activity_data['ActivityStatus'])
        print(user_data)
        cursor.execute(insert_query, user_data)
        conn.commit()
        
        ActivityPlanHistoryActivityID = cursor.lastrowid
        
        insert_query = "INSERT INTO ProjectMonitoringReportActivity (ProjectMonitoringReportID, ActivityID) VALUES (%s, %s)"
        user_data = (projectMonitoringReportID, ActivityPlanHistoryActivityID)
        print(user_data)
        cursor.execute(insert_query, user_data)
        conn.commit()
        
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Gantt updated successfully' , 'statuscode' : 200}), 200




# Route to update budget of specific project
@monitoring_blueprint.route('/update_project_budget_for_report/<int:projectMonitoringReportID>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def update_project_budget_for_report(projectMonitoringReportID):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    for budget_data in data:
        update_query = "UPDATE BudgetPlan SET SerialNo = %s , Item = %s , Quantity = %s , UnitPrice = %s , TotalCost = %s WHERE ProjectID = %s AND BudgetID = %s"
        project_data = (budget_data['SerialNo'], budget_data['Item'], budget_data['Quantity'], budget_data['UnitPrice'], budget_data['TotalCost'] , budget_data['ProjectID'], budget_data['BudgetID'])
        cursor.execute(update_query, project_data)
        print(budget_data)
        conn.commit()
        
        insert_query = "INSERT INTO BudgetPlanHistory (ProjectID, SerialNo, Item, Quantity, UnitPrice , TotalCost) VALUES (%s, %s, %s, %s, %s , %s)"
        user_data = (budget_data['ProjectID'], budget_data['SerialNo'], budget_data['Item'], budget_data['Quantity'], budget_data['UnitPrice'] , budget_data['TotalCost'])
        print(user_data)
        cursor.execute(insert_query, user_data)
        conn.commit()
        
        BudgetPlanHistoryBudgetID = cursor.lastrowid
        
        insert_query = "INSERT INTO ProjectMonitoringReportBudget (ProjectMonitoringReportID, BudgetID) VALUES (%s, %s)"
        user_data = (projectMonitoringReportID, BudgetPlanHistoryBudgetID)
        print(user_data)
        cursor.execute(insert_query, user_data)
        conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Budget updated successfully' , 'statuscode' : 200}), 200



# Route to get all projects
@monitoring_blueprint.route('/get_single_project_monitoring_history/<int:projectID>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])  
def get_single_project_monitoring_history(projectID):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    current_user_id = get_jwt_identity()
    
    cursor.execute("SELECT * FROM ProjectMonitoringReport WHERE ProjectID = %s ORDER BY ProjectMonitoringReportID DESC" , (projectID,))
    single_project_monitoring_report_list = cursor.fetchall()
    print(single_project_monitoring_report_list)

    cursor.close()
    conn.close()
    
    return jsonify({'projects': single_project_monitoring_report_list  , "statuscode" : 200}) , 200





# Route to get a specific project for fund self
@monitoring_blueprint.route('/get_specific_project_monitoring_report/<int:monitoringReportID>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4])
def get_specific_project_monitoring_report(monitoringReportID):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM ProjectMonitoringReport WHERE ProjectMonitoringReportID = %s", (monitoringReportID,))
    project_monitoring_report_data = cursor.fetchone()
    
    cursor.close()
    conn.close()
    if project_monitoring_report_data:
        return jsonify({'monitoring_report_data': project_monitoring_report_data , 'statuscode' : 200}), 200
    else:
        return jsonify({'message': 'project not found' , 'statuscode' : 404}), 404




# Route to fetch all budget for a specific project
@monitoring_blueprint.route('/get_self_project_gantt_history/<int:monitoringReportID>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2, 3, 4, 5]) 
def get_self_project_gantt_history(monitoringReportID):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM ActivityPlanHistory ap WHERE ap.ActivityID IN ( SELECT pma.ActivityID FROM ProjectMonitoringReportActivity pma WHERE pma.ProjectMonitoringReportID = %s)", (monitoringReportID,))
    ProjectIDObjectList = cursor.fetchall()
    
    
    conn.commit()
    cursor.close()
    conn.close()
    
    return jsonify({'gantt_list': ProjectIDObjectList ,'statuscode' : 200}), 200 



# Route to fetch all budget for a specific project
@monitoring_blueprint.route('/get_self_project_budget_history/<int:monitoringReportID>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2, 3, 4, 5]) 
def get_self_project_budget_history(monitoringReportID):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM BudgetPlanHistory ap WHERE ap.BudgetID IN ( SELECT pma.BudgetID FROM ProjectMonitoringReportBudget pma WHERE pma.ProjectMonitoringReportID = %s)", (monitoringReportID,))
    budgetHistoryList = cursor.fetchall()
    
    
    conn.commit()
    cursor.close()
    conn.close()
    
    return jsonify({'budget_list': budgetHistoryList ,'statuscode' : 200}), 200 


@monitoring_blueprint.route('/list_monitoring_feedback_project_and_pi_can_see', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2, 3, 4, 5]) 
def list_monitoring_feedback_project_and_pi_can_see():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    # current_user_id = get_jwt_identity()
    current_user_id = 5
    # Get the project IDs associated with the current user from projectlistwithuserid table
    cursor.execute("SELECT ProjectID FROM ProjectListWithUserID WHERE UserID = %s", (current_user_id,))
    user_projects = cursor.fetchall()
    if len(user_projects) == 0:
        return jsonify({'ProjectFeedbackList': [] , "statuscode" : 200, "message" : "No projects found for this user"}) , 200
    else:
        print("Count how many of the user's projects are added in the review table")
        # Count how many of the user's projects are added in the review table
        myProjectList = [project['ProjectID'] for project in user_projects]
        print(myProjectList)
        print(len(myProjectList))
    
        cursor.execute("SELECT * FROM ProjectMonitoringFeedback WHERE ProjectMonitoringReportID IN (SELECT ProjectMonitoringReportID FROM ProjectMonitoringReport WHERE ProjectID IN (SELECT ProjectID FROM ProjectListWithUserID WHERE UserID = %s)) AND PiCanViewOrNot = 1 GROUP BY ProjectMonitoringReportID HAVING COUNT(*) = 3", (current_user_id,))
        ProjectMonitoringFeedbackList = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    if len(ProjectMonitoringFeedbackList) == 0:
        return jsonify({'ProjectFeedbackList': [] , "statuscode" : 200, "message" : "No projects monitoring feedback found"}) , 200
    return jsonify({'ProjectFeedbackList': ProjectMonitoringFeedbackList , "statuscode" : 200, "message" : "success"}) , 200




# Route to get total number of review dashboard
@monitoring_blueprint.route('/monitoring_panel_overview', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1])  # Only admin and supervisor can access this route
def monitoring_panel_overview():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    
    cursor.execute("SELECT COUNT(*) AS committee_gave_feedback FROM ( SELECT ProjectMonitoringReportID FROM ProjectMonitoringFeedback GROUP BY ProjectMonitoringReportID HAVING COUNT(*) = 3 ) AS MonitoringReportWithThreeFeedbacks")
    committee_gave_feedback = cursor.fetchone()
    
    cursor.execute("SELECT COUNT(DISTINCT ProjectMonitoringReportID) AS assigned_monitoring_committee FROM ProjectReportListWithMonitoringCommitteeID")
    assigned_monitoring_committee = cursor.fetchall()
    
    cursor.execute("SELECT COUNT(ProjectMonitoringReportID) AS need_to_assign_monitoring_committee FROM ProjectMonitoringReport WHERE ProjectMonitoringReportID NOT IN (SELECT ProjectMonitoringReportID FROM ProjectReportListWithMonitoringCommitteeID)")
    need_to_assign_monitoring_committee = cursor.fetchall()

    
    cursor.close()
    conn.close()
    
    return jsonify({
        'committee_gave_feedback': committee_gave_feedback['committee_gave_feedback'],
        'need_to_assign_monitoring_committee': need_to_assign_monitoring_committee[0]['need_to_assign_monitoring_committee'],
        'assigned_monitoring_committee': assigned_monitoring_committee[0]['assigned_monitoring_committee'],
        'statuscode' : 200
    }) , 200



@monitoring_blueprint.route('/get_all_monitoring_report_need_to_assign_committee', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def get_all_monitoring_report_need_to_assign_committee():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM ProjectMonitoringReport WHERE ProjectMonitoringReportID NOT IN (SELECT DISTINCT ProjectMonitoringReportID FROM ProjectReportListWithMonitoringCommitteeID)")
    NeedToAssignCommitteeList = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'MonitoringReportNeedToAssignCommitteeList': NeedToAssignCommitteeList , "statuscode" : 200}) , 200



@monitoring_blueprint.route('/get_committeeuserid_for_specific_monitoring_report/<int:monitoringReportID>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def get_committeeuserid_for_specific_monitoring_report(monitoringReportID):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT MonitoringCommitteeUserID FROM ProjectReportListWithMonitoringCommitteeID WHERE ProjectMonitoringReportID = %s", (monitoringReportID,))
    committeeuserid = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'committeeuserid': committeeuserid , 'statuscode' : 200}), 200



@monitoring_blueprint.route('/set_monitoring_committee_for_specific_project_monitoring_report', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def set_reviewer_for_specific_project():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    insert_query = "INSERT INTO ProjectReportListWithMonitoringCommitteeID (ProjectMonitoringReportID, MonitoringCommitteeUserID) VALUES (%s, %s)"
    review_data = (data['ProjectMonitoringReportID'], data['MonitoringCommitteeUserID'])
    cursor.execute(insert_query, review_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Monitoring Committee Set successfully' , 'statuscode' : 201}), 201



@monitoring_blueprint.route('/get_all_projects_have_to_monitor', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def get_all_projects_have_to_monitor():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()

    # cursor.execute("SELECT * FROM ProjectMonitoringReport WHERE ProjectMonitoringReportID IN (SELECT ProjectMonitoringReportID FROM ProjectReportListWithMonitoringCommitteeID WHERE MonitoringCommitteeUserID = %s)", (current_user_id,))
    cursor.execute("SELECT  pmr.ProjectMonitoringReportID, pmr.ProjectID, pmr.ReportDate, pmr.ReportFileLocation, pmf.MonitoringFeedbackFileLocation, pmf.MonitoringCommitteeUserID FROM  ProjectMonitoringReport pmr JOIN  ProjectReportListWithMonitoringCommitteeID prlmc  ON pmr.ProjectMonitoringReportID = prlmc.ProjectMonitoringReportID LEFT JOIN  ProjectMonitoringFeedback pmf  ON pmr.ProjectMonitoringReportID = pmf.ProjectMonitoringReportID AND prlmc.MonitoringCommitteeUserID = pmf.MonitoringCommitteeUserID WHERE  prlmc.MonitoringCommitteeUserID = %s", (current_user_id,))
    ProjectHaveToMonitorList = cursor.fetchall()
    
    cursor.close()
    conn.close()
    return jsonify({'ProjectHaveToMonitorList': ProjectHaveToMonitorList , "statuscode" : 200}) , 200




@monitoring_blueprint.route('/check_a_monitoring_report_feedback_given_or_not/<int:monitoringReportID>/<int:user_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def check_a_monitoring_report_feedback_given_or_not(monitoringReportID , user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM ProjectMonitoringFeedback WHERE ProjectMonitoringReportID = %s AND MonitoringCommitteeUserID = %s", (monitoringReportID , user_id))
    MonitoringReportFeedbackCheck = cursor.fetchall()
    cursor.close()
    conn.close()
    if MonitoringReportFeedbackCheck:
        return jsonify({'MonitoringReportFeedbackCheck': "Yes" , "statuscode" : 200}) , 200
    else:
        return jsonify({'MonitoringReportFeedbackCheck': "No" , "statuscode" : 200}) , 200




@monitoring_blueprint.route('/get_all_monitoring_report_already_assigned_committee', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def get_all_monitoring_report_already_assigned_committee():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM ProjectMonitoringReport WHERE ProjectMonitoringReportID IN (SELECT DISTINCT ProjectMonitoringReportID FROM ProjectReportListWithMonitoringCommitteeID)")
    MonitoringReportAssignedCommitteeList = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'MonitoringReportAssignedCommitteeList': MonitoringReportAssignedCommitteeList , "statuscode" : 200}) , 200



# Route to get all reviews for a specific reviewer user
@monitoring_blueprint.route('/get_all_feedback_for_specific_monitoring_committee_and_specific_report', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def get_all_feedback_for_specific_monitoring_committee_and_specific_report():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM ProjectMonitoringFeedback WHERE ProjectMonitoringReportID = %s AND MonitoringCommitteeUserID = %s", (data['ProjectMonitoringReportID'], data['MonitoringCommitteeUserID']))
    feedback = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'feedback': feedback , 'statuscode' : 200}), 200



# Route to create a new review for a project
@monitoring_blueprint.route('/create_feedback_specific_monitoring_report', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([2 , 3 , 4 , 5])
def create_feedback_specific_monitoring_report():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    insert_query = "INSERT INTO ProjectMonitoringFeedback (ProjectMonitoringReportID, ProjectID, MonitoringCommitteeUserID, Observation , Suggestions , Recommendations ,Endorsement, PiCanViewOrNot) VALUES (%s, %s, %s, %s , %s, %s, %s, %s)"
    review_data = (data['ProjectMonitoringReportID'], data['ProjectID'], data['MonitoringCommitteeUserID'], data['Observation'] , data['Suggestions'], data['Recommendations'] , data['Endorsement'] , 0)
    cursor.execute(insert_query, review_data)
    feedback_id = cursor.lastrowid
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Feedback created successfully' , 'statuscode' : 201, "feedback_id": feedback_id}), 201



# Route to get all projects reviewer given review
@monitoring_blueprint.route('/get_all_monitoring_report_committee_has_given_feedback', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def get_all_monitoring_report_committee_has_given_feedback():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM ProjectMonitoringFeedback GROUP BY ProjectMonitoringReportID HAVING COUNT(*) = 3")
    feedback_list = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return jsonify({'feedback_list': feedback_list  , "statuscode" : 200}) , 200



# Route to get all reviews for a specific project
@monitoring_blueprint.route('/get_feedback_for_specific_monitoring_report/<int:monitoringReportID>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def get_feedback_for_specific_monitoring_report(monitoringReportID):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM ProjectMonitoringFeedback WHERE ProjectMonitoringReportID = %s", (monitoringReportID,))
    feedback = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'feedback': feedback , 'statuscode' : 200}), 200




# Route to update a specific project review PiCanViewOrNot 0 means can not view 1 means can view
@monitoring_blueprint.route('/update_picanviewornot_in_project_monitoring_feedback/<int:monitoringReportID>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def update_picanviewornot_in_project_monitoring_feedback(monitoringReportID):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("UPDATE ProjectMonitoringFeedback SET PiCanViewOrNot = 1 WHERE ProjectMonitoringReportID = %s" , (monitoringReportID,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'ProjectMonitoringFeedback PiCanViewOrNot updated successfully' , 'statuscode' : 200}), 200




@monitoring_blueprint.route('/get_all_my_monitoring_report_history', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def get_all_my_monitoring_report_history():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()
    
    cursor.execute("SELECT * FROM ProjectMonitoringReport pmr INNER JOIN Projects p ON pmr.ProjectID = p.ProjectID WHERE p.CreatorUserID = %s ORDER BY ProjectMonitoringReportID DESC", (current_user_id,))
    MyProjectMonitoringHistoryList = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'MyProjectMonitoringHistoryList': MyProjectMonitoringHistoryList , "statuscode" : 200}) , 200


# ==========================================  Monitoring Related Routes END  =============================
