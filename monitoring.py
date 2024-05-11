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
    
    cursor.execute("SELECT COUNT(DISTINCT pmf.ProjectID) AS feedback_from_committee FROM ProjectMonitoringFeedback pmf INNER JOIN Projects p ON pmf.ProjectID = p.ProjectID WHERE p.CreatorUserID = %s" , (current_user_id,))
    feedback_from_committee = cursor.fetchone()
    print(feedback_from_committee['feedback_from_committee'])
    
    cursor.close()
    conn.close()
    
    return jsonify({
        'send_for_monitoring': send_for_monitoring['send_for_monitoring'],
        'feedback_from_committee': feedback_from_committee['feedback_from_committee'],
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
# @jwt_required()  # Protect the route with JWT
# @role_required([1 , 2, 3, 4, 5]) 
def get_self_project_gantt_history(monitoringReportID):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT ProjectID FROM ProjectMonitoringReport WHERE ProjectMonitoringReportID = %s", (monitoringReportID,))
    ProjectIDObject = cursor.fetchone()
    ProjectID = ProjectIDObject['ProjectID']
    
    cursor.execute("SELECT * FROM ActivityPlanHistory ap WHERE ap.ActivityID IN ( SELECT pma.ActivityID FROM ProjectMonitoringReportActivity pma WHERE pma.ProjectMonitoringReportID = %s)", (monitoringReportID,))
    ProjectIDObjectList = cursor.fetchall()
    
    
    conn.commit()
    cursor.close()
    conn.close()
    
    return jsonify({'gantt_list': ProjectIDObjectList ,'statuscode' : 200}), 200 



# Route to fetch all budget for a specific project
@monitoring_blueprint.route('/get_self_project_budget_history/<int:monitoringReportID>', methods=['GET'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1 , 2, 3, 4, 5]) 
def get_self_project_budget_history(monitoringReportID):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT ProjectID FROM ProjectMonitoringReport WHERE ProjectMonitoringReportID = %s", (monitoringReportID,))
    ProjectIDObject = cursor.fetchone()
    ProjectID = ProjectIDObject['ProjectID']
    
    cursor.execute("SELECT * FROM BudgetPlanHistory ap WHERE ap.BudgetID IN ( SELECT pma.BudgetID FROM ProjectMonitoringReportBudget pma WHERE pma.ProjectMonitoringReportID = %s)", (monitoringReportID,))
    ProjectIDObjectList = cursor.fetchall()
    
    
    conn.commit()
    cursor.close()
    conn.close()
    
    return jsonify({'budget_list': ProjectIDObjectList ,'statuscode' : 200}), 200 



# ==========================================  Monitoring Related Routes END  =============================
