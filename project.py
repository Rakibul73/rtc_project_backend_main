from datetime import datetime
from flask import request, jsonify, Blueprint
from auth_utils import origin_verifier, role_required
from db import get_db  # local module
from flask_jwt_extended import get_jwt_identity, jwt_required
from dateutil import parser


project_blueprint = Blueprint('project', __name__)

# ==========================================  Project Related Routes START =============================


# Route to get project status of a specified project
@project_blueprint.route('/get_project_status_specific_project/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def get_project_status_specific_project(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        "SELECT ProjectStatus FROM Projects WHERE ProjectID = %s", (project_id,))
    ProjectStatus = cursor.fetchone()
    cursor.close()
    conn.close()
    print(ProjectStatus['ProjectStatus'])
    return jsonify({'ProjectStatus': ProjectStatus['ProjectStatus'], "statuscode": 200}), 200


# Route to update project status & total points of specific project
@project_blueprint.route('/update_projectstatus_point/<int:project_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def update_projectstatus_point(project_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    print(data)
    update_query = "UPDATE Projects SET ProjectStatus = %s , TotalPoints = %s WHERE ProjectID = %s"
    project_data = (data['ProjectStatus'], data['TotalPoints'], project_id)
    cursor.execute(update_query, project_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Status & Total Points updated successfully', 'statuscode': 200}), 200


# Route to get all projects
@project_blueprint.route('/projects', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1])
def get_all_projects():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM Projects")
    project_list = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify({'projects': project_list, "statuscode": 200}), 200


# Route to create a new project
@project_blueprint.route('/create_projects', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def create_project():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()

    # Validate input data
    if 'ProjectTitle' not in data or 'CreatorUserID' not in data:
        return jsonify({'error': 'Incomplete data. Title, CreatorUserID are required.', "statuscode": 400}), 400

    insert_query = "INSERT INTO Projects (CodeByRTC, DateRecieved, ProjectTitle, NatureOfResearchProposal , NameOfCollaboratingDepartments , AddressOfCollaboratingDepartments , NameOfCollaboratingInstitutes , AddressOfCollaboratingInstitutes ,  LocationOfFieldActivities , DurationOfResearchProjectAnnual , DurationOfResearchProjectLongTerm , TotalBudgetOfResearchProposalTK , ExternalAgencyFundingSource , ExternalAgencyFundingSourcesName , ExternalAgencyFundingSourcesSubmissionDate , CommitmentOtherResearchProject , CommitmentOtherResearchProjectName , ProjectDescription , ProjectObjective , PstuNationalGoal , PriorResearchOverview , Methodology , MethodologyFileLocation , ExpectedOutput , SuccessIndicators , Beneficiaries , ManPowerExisting , ManPowerRequired , SmallEquipmentExisting , SmallEquipmentRequired ,ResearchMaterialsExisting ,  ResearchMaterialsRequired ,OtherExisting , OtherRequired , CreatorUserID , CoPiUserID , StudentUserID , CreatorUserSealLocation , CreatorUserSignatureLocation , CreatorUserSignatureDate , ChairmanOfDepartmentComment , ChairmanOfDepartmentSealLocation , ChairmanOfDepartmentSignatureLocation , ChairmanOfDepartmentSignatureDate , ProjectStatus , TotalPoints) VALUES (%s, %s , %s , %s , %s , %s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s , %s )"
    user_data = (data['CodeByRTC'], data['DateRecieved'], data['ProjectTitle'], data['NatureOfResearchProposal'], data['NameOfCollaboratingDepartments'], data['AddressOfCollaboratingDepartments'], data['NameOfCollaboratingInstitutes'], data['AddressOfCollaboratingInstitutes'], data['LocationOfFieldActivities'], data['DurationOfResearchProjectAnnual'], data['DurationOfResearchProjectLongTerm'], data['TotalBudgetOfResearchProposalTK'], data['ExternalAgencyFundingSource'], data['ExternalAgencyFundingSourcesName'], data['ExternalAgencyFundingSourcesSubmissionDate'], data['CommitmentOtherResearchProject'], data['CommitmentOtherResearchProjectName'], data['ProjectDescription'], data['ProjectObjective'], data['PstuNationalGoal'],
                 data['PriorResearchOverview'], data['Methodology'], data['MethodologyFileLocation'], data['ExpectedOutput'], data['SuccessIndicators'], data['Beneficiaries'], data['ManPowerExisting'], data['ManPowerRequired'], data['SmallEquipmentExisting'], data['SmallEquipmentRequired'], data['ResearchMaterialsExisting'], data['ResearchMaterialsRequired'], data['OtherExisting'], data['OtherRequired'], data['CreatorUserID'], data['CoPiUserID'], data['StudentUserID'], data['CreatorUserSealLocation'], data['CreatorUserSignatureLocation'], data['CreatorUserSignatureDate'], data['ChairmanOfDepartmentComment'], data['ChairmanOfDepartmentSealLocation'], data['ChairmanOfDepartmentSignatureLocation'], data['ChairmanOfDepartmentSignatureDate'], "Pending", 0)
    cursor.execute(insert_query, user_data)
    conn.commit()

    # ProjectStatus = "Pending" , "Approved" , "Rejected" , "Running" , "Completed"
    # After successfully inserting into projects table, update projectlistwithuserid
    # Assuming project_id is auto-incremented in projects table
    project_id = cursor.lastrowid
    # Insert into projectlistwithuserid
    project_list_query = "INSERT INTO ProjectListWithUserID (UserID, ProjectID , ProjectTitle ) VALUES (%s, %s , %s )"
    project_list_data = (data['CreatorUserID'],
                         project_id, data['ProjectTitle'])
    cursor.execute(project_list_query, project_list_data)
    conn.commit()

    print("The auto-incremented project ID is:", project_id)

    cursor.close()
    conn.close()
    return jsonify({'message': 'Project created successfully', 'project_id': project_id, 'statuscode': 201}), 201


# Route to get a specific project
@project_blueprint.route('/projects/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4])
def get_specific_project(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        "SELECT * FROM Projects WHERE ProjectID = %s", (project_id,))
    project_data = cursor.fetchone()
    cursor.close()
    conn.close()
    if project_data:
        return jsonify({'project': project_data, 'statuscode': 200}), 200
    else:
        return jsonify({'message': 'project not found', 'statuscode': 404}), 404


# Route to get projecttitle from a specific project
@project_blueprint.route('/projecttitle/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4])
def get_specific_project_title(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        "SELECT StudentUserID, CoPiUserID , CreatorUserID , ProjectTitle, CodeByRTC FROM Projects WHERE ProjectID = %s", (project_id,))
    project_data = cursor.fetchone()
    print(project_data)
    cursor.close()
    conn.close()
    if project_data:
        return jsonify({'project': project_data, 'statuscode': 200}), 200
    else:
        return jsonify({'message': 'project not found', 'statuscode': 404}), 404


# # Route to update all fields of a project only if user is admin
# @project_blueprint.route('/update_project_admin/<int:project_id>', methods=['PUT'])
# @jwt_required()  # Protect the route with JWT
# @origin_verifier
# @role_required([1])
# def update_project_admin(project_id):
#     data = request.get_json()
#     conn = get_db()
#     cursor = conn.cursor()
#     update_query = "UPDATE Projects SET CodeByRTC = %s , DateRecieved = %s , ProjectTitle = %s , NatureOfResearchProposal = %s , NameOfCollaboratingDepartments = %s , AddressOfCollaboratingDepartments = %s , NameOfCollaboratingInstitutes = %s , AddressOfCollaboratingInstitutes = %s ,  LocationOfFieldActivities = %s , DurationOfResearchProjectAnnual = %s , DurationOfResearchProjectLongTerm = %s , TotalBudgetOfResearchProposalTK = %s , ExternalAgencyFundingSourcesName = %s , ExternalAgencyFundingSourcesSubmissionDate = %s , ProjectDescription = %s , ProjectAbstract = %s , ProjectObjective = %s , PstuNationalGoal = %s , PriorResearchOverview = %s , Methodology = %s , ExpectedOutput = %s , SuccessIndicators = %s , Beneficiaries = %s , ManPowerExisting = %s , ManPowerRequired = %s , SmallEquipmentExisting = %s , SmallEquipmentRequired ,ResearchMaterialsExisting = %s ,  ResearchMaterialsRequired ,OtherExisting = %s , OtherRequired = %s , ResearchCarriedOutPlace = %s , CreatorUserID = %s , CreatorUserDate = %s , CreatorUserSealLocation = %s , ChairmanOfDepartmentComment = %s , ChairmanOfDepartmentSignatureLocation = %s , ChairmanOfDepartmentSignatureDate = %s , ResultsAndDiscussion = %s , KeyAchievements = %s , ProjectStatus = %s , TotalPoints = %s , ProjectSoftCopyLocation = %s  WHERE ProjectID = %s"
#     user_data = ( data['CodeByRTC'], data['DateRecieved'], data['ProjectTitle'], data['NatureOfResearchProposal'] , data["NameOfCollaboratingDepartments"] , data["AddressOfCollaboratingDepartments"] , data["NameOfCollaboratingInstitutes"] , data["AddressOfCollaboratingInstitutes"] , data[" LocationOfFieldActivities"] , data["DurationOfResearchProjectAnnual"] , data["DurationOfResearchProjectLongTerm"] , data["TotalBudgetOfResearchProposalTK"] , data["ExternalAgencyFundingSourcesName"] , data["ExternalAgencyFundingSourcesSubmissionDate"] , data["ProjectDescription"] , data["ProjectAbstract"] , data["ProjectObjective"] , data["PstuNationalGoal"] , data["PriorResearchOverview"] , data["Methodology"] , data["ExpectedOutput"] , data["SuccessIndicators"] , data["Beneficiaries"] , data["ManPowerExisting"] , data["ManPowerRequired"] , data["SmallEquipmentExisting"] , data["SmallEquipmentRequired ,ResearchMaterialsExisting"] , data[" ResearchMaterialsRequired ,OtherExisting"] , data["OtherRequired"] , data["ResearchCarriedOutPlace"] , data["CreatorUserID"] , data["CreatorUserDate"] , data["CreatorUserSealLocation"] , data["ChairmanOfDepartmentComment"] , data["ChairmanOfDepartmentSignatureLocation"] , data["ChairmanOfDepartmentSignatureDate"] , data["ResultsAndDiscussion"] , data["KeyAchievements"] , data["ProjectStatus"] , data["TotalPoints"] , data["ProjectSoftCopyLocation"] , project_id)

#     cursor.execute(update_query, user_data)
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': 'Project updated successfully', 'statuscode' : 200}), 200


# Route to delete a project
@project_blueprint.route('/projects/<int:project_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1])
def delete_project(project_id):
    conn = get_db()
    cursor = conn.cursor()
    # Remove from ActivityPlan table based on ProjectID
    delete_activity_query = "DELETE FROM ActivityPlan WHERE ProjectID = %s"
    cursor.execute(delete_activity_query, (project_id,))
    # Remove from BudgetPlan table based on ProjectID
    delete_budget_query = "DELETE FROM BudgetPlan WHERE ProjectID = %s"
    cursor.execute(delete_budget_query, (project_id,))
    # Remove from Review table based on ProjectID
    delete_review_query = "DELETE FROM Review WHERE ProjectID = %s"
    cursor.execute(delete_review_query, (project_id,))
    # Remove from ProjectListWithReviewerID table based on ProjectID
    delete_review_query = "DELETE FROM ProjectListWithReviewerID WHERE ProjectID = %s"
    cursor.execute(delete_review_query, (project_id,))
    # Remove from ProjectListWithUserID table based on ProjectID
    delete_project_list_query = "DELETE FROM ProjectListWithUserID WHERE ProjectID = %s"
    cursor.execute(delete_project_list_query, (project_id,))
    # Remove from Projects table based on ProjectID
    delete_query = "DELETE FROM Projects WHERE ProjectID = %s"
    cursor.execute(delete_query, (project_id,))

    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project with id ' + str(project_id) + ' deleted successfully', 'statuscode': 200}), 200


# # Route to delete multiple projects by IDs
# @project_blueprint.route('/projects/delete_multiple_projects', methods=['DELETE'])
# @jwt_required()  # Protect the route with JWT
# @origin_verifier
# @role_required([1])
# def delete_multiple_projects():
#     try:
#         # Get the list of project IDs from the request body
#         data = request.get_json()
#         project_ids = data.get('project_ids', [])

#         if not project_ids:
#             return jsonify({'error': 'No project IDs provided'}), 400

#         conn = get_db()
#         cursor = conn.cursor()

#         for project_id in project_ids:
#             # Remove from ActivityPlan table based on ProjectID
#             delete_activity_query = "DELETE FROM ActivityPlan WHERE ProjectID = %s"
#             cursor.execute(delete_activity_query, (project_id,))
#             # Remove from Review table based on ProjectID
#             delete_review_query = "DELETE FROM Review WHERE ProjectID = %s"
#             cursor.execute(delete_review_query, (project_id,))
#             # Remove from ProjectListWithUserID table based on ProjectID
#             delete_project_list_query = "DELETE FROM ProjectListWithUserID WHERE ProjectID = %s"
#             cursor.execute(delete_project_list_query, (project_id,))
#             # Remove from Projects table based on ProjectID
#             delete_query = "DELETE FROM Projects WHERE ProjectID = %s"
#             cursor.execute(delete_query, (project_id,))

#         conn.commit()
#         cursor.close()
#         conn.close()

#         return jsonify({'message': 'Projects deleted successfully', 'statuscode': 200}), 200
#     except Exception as e:
#         return jsonify({'error': str(e), 'statuscode': 500}), 500


# Route to update basic info of a project of self
@project_blueprint.route('/update_project/<int:project_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4])
def update_project(project_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    update_query = "UPDATE Projects SET CodeByRTC = %s , DateRecieved = %s , ProjectTitle = %s , NatureOfResearchProposal = %s , NameOfCollaboratingDepartments = %s , AddressOfCollaboratingDepartments = %s , NameOfCollaboratingInstitutes = %s , AddressOfCollaboratingInstitutes = %s , LocationOfFieldActivities = %s , DurationOfResearchProjectAnnual = %s , DurationOfResearchProjectLongTerm = %s , TotalBudgetOfResearchProposalTK = %s , ExternalAgencyFundingSource = %s , ExternalAgencyFundingSourcesName = %s , ExternalAgencyFundingSourcesSubmissionDate = %s , CommitmentOtherResearchProject = %s , CommitmentOtherResearchProjectName = %s , ProjectDescription = %s , ProjectObjective = %s , PstuNationalGoal = %s , PriorResearchOverview = %s , Methodology = %s , MethodologyFileLocation = %s , ExpectedOutput = %s , SuccessIndicators = %s , Beneficiaries = %s , ManPowerExisting = %s , ManPowerRequired = %s , SmallEquipmentExisting = %s , SmallEquipmentRequired = %s , ResearchMaterialsExisting = %s , ResearchMaterialsRequired = %s , OtherExisting = %s , OtherRequired = %s , CreatorUserID = %s , CoPiUserID = %s , StudentUserID = %s , CreatorUserSealLocation = %s , CreatorUserSignatureLocation = %s , CreatorUserSignatureDate = %s , ChairmanOfDepartmentComment = %s , ChairmanOfDepartmentSealLocation = %s , ChairmanOfDepartmentSignatureLocation = %s , ChairmanOfDepartmentSignatureDate = %s , ProjectStatus = %s , ProjectSoftCopyLocation = %s  WHERE ProjectID = %s"
    project_data = (data['CodeByRTC'], data['DateRecieved'], data['ProjectTitle'], data['NatureOfResearchProposal'], data['NameOfCollaboratingDepartments'], data['AddressOfCollaboratingDepartments'], data['NameOfCollaboratingInstitutes'], data['AddressOfCollaboratingInstitutes'], data['LocationOfFieldActivities'], data['DurationOfResearchProjectAnnual'], data['DurationOfResearchProjectLongTerm'], data['TotalBudgetOfResearchProposalTK'], data['ExternalAgencyFundingSource'], data['ExternalAgencyFundingSourcesName'], data['ExternalAgencyFundingSourcesSubmissionDate'], data['CommitmentOtherResearchProject'], data['CommitmentOtherResearchProjectName'], data['ProjectDescription'], data['ProjectObjective'], data['PstuNationalGoal'], data['PriorResearchOverview'],
                    data['Methodology'], data['MethodologyFileLocation'], data['ExpectedOutput'], data['SuccessIndicators'], data['Beneficiaries'], data['ManPowerExisting'], data['ManPowerRequired'], data['SmallEquipmentExisting'], data['SmallEquipmentRequired'], data['ResearchMaterialsExisting'], data['ResearchMaterialsRequired'], data['OtherExisting'], data['OtherRequired'], data['CreatorUserID'], data['CoPiUserID'], data['StudentUserID'], data['CreatorUserSealLocation'], data['CreatorUserSignatureLocation'], data['CreatorUserSignatureDate'], data['ChairmanOfDepartmentComment'], data['ChairmanOfDepartmentSealLocation'], data['ChairmanOfDepartmentSignatureLocation'], data['ChairmanOfDepartmentSignatureDate'], data['ProjectStatus'], data['ProjectSoftCopyLocation'], project_id)

    cursor.execute(update_query, project_data)

    project_list_query = "UPDATE ProjectListWithUserID SET ProjectTitle = %s WHERE ProjectID = %s"
    project_list_data = (data['ProjectTitle'], project_id)
    cursor.execute(project_list_query, project_list_data)

    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project updated successfully', 'statuscode': 200}), 200


# Route to get admin project dashboard
@project_blueprint.route('/get_admin_project_dashboard', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1])  # Only admin can access this route
def get_admin_project_dashboard():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT COUNT(*) AS completed_projects FROM Projects WHERE ProjectStatus = 'Completed'")
    completed_projects = cursor.fetchone()
    print(completed_projects['completed_projects'])

    cursor.execute("SELECT COUNT(*) AS total_projects FROM Projects")
    total_projects = cursor.fetchone()
    print(total_projects['total_projects'])

    cursor.execute(
        "SELECT COUNT(*) AS pending_projects FROM Projects WHERE ProjectStatus = 'Pending'")
    pending_projects = cursor.fetchone()
    print(pending_projects['pending_projects'])

    cursor.execute(
        "SELECT COUNT(*) AS approved_projects FROM Projects WHERE ProjectStatus = 'Approved'")
    approved_projects = cursor.fetchone()
    print(approved_projects['approved_projects'])

    cursor.execute(
        "SELECT COUNT(*) AS rejected_projects FROM Projects WHERE ProjectStatus = 'Rejected'")
    rejected_projects = cursor.fetchone()
    print(rejected_projects['rejected_projects'])

    cursor.execute(
        "SELECT COUNT(*) AS running_projects FROM Projects WHERE ProjectStatus = 'Running'")
    running_projects = cursor.fetchone()
    print(running_projects['running_projects'])

    cursor.execute(
        "SELECT COUNT(*) AS final_report_submitted FROM Projects WHERE  ProjectSoftCopyLocation IS NOT NULL AND ProjectSoftCopyLocation != ''")
    final_report_submitted = cursor.fetchone()
    print(final_report_submitted['final_report_submitted'])

    cursor.close()
    conn.close()

    return jsonify({
        'running_projects': running_projects['running_projects'],
        'rejected_projects': rejected_projects['rejected_projects'],
        'approved_projects': approved_projects['approved_projects'],
        'pending_projects': pending_projects['pending_projects'],
        'final_report_submitted': final_report_submitted['final_report_submitted'],
        'completed_projects': completed_projects['completed_projects'],
        'total_projects': total_projects['total_projects'],
        'statuscode': 200
    }), 200


# Route to get all projects for a  self specific user
@project_blueprint.route('/myprojects/user/<int:user_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
def get_projects_for_user(user_id):
    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()

    # Check if the current user is authorized to access projects
    if current_user_id != user_id:
        return jsonify({'message': 'Unauthorized access to user projects', 'statuscode': 403}), 403

    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    # Query to get projects for the specified user ID
    cursor.execute(
        "SELECT * FROM Projects WHERE CreatorUserID = %s", (user_id,))
    project_list = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify({'projects': project_list, 'statuscode': 200}), 200


# Route to create project gantt for a specific project
@project_blueprint.route('/create_project_gantt/<int:project_id>', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def create_project_gantt(project_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()

    print(data['formDatas'])
    print("project id = ", project_id)

    # Iterate through the form datas and insert into the database
    for individual_data in data['formDatas']:
        insert_query = "INSERT INTO ActivityPlan (ProjectID, Activity, StartDate, EndDate, ActivityStatus) VALUES (%s, %s, %s, %s, %s)"
        user_data = (project_id, individual_data['workActivity'], individual_data['duration'].split(
            ' - ')[0], individual_data['duration'].split(' - ')[1], individual_data['activityStatus'])
        print(user_data)
        cursor.execute(insert_query, user_data)
        conn.commit()
        insert_query = "INSERT INTO ActivityPlanOriginal (ProjectID, Activity, StartDate, EndDate, ActivityStatus) VALUES (%s, %s, %s, %s, %s)"
        user_data = (project_id, individual_data['workActivity'], individual_data['duration'].split(
            ' - ')[0], individual_data['duration'].split(' - ')[1], individual_data['activityStatus'])
        print(user_data)
        cursor.execute(insert_query, user_data)
        conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'message': 'Project Gantt created successfully', 'statuscode': 201}), 201



# Route to create project budget for a specific project
@project_blueprint.route('/create_project_budget/<int:project_id>', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def create_project_budget(project_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()

    print(data['formDatas'])
    print("project id = ", project_id)

    # Iterate through the form datas and insert into the database
    for individual_data in data['formDatas']:
        insert_query = "INSERT INTO BudgetPlan (ProjectID, SerialNo, Item, Quantity, UnitPrice , TotalCost) VALUES (%s, %s, %s, %s, %s , %s)"
        user_data = (project_id, individual_data['serialNo'], individual_data['item'],
                     individual_data['quantity'], individual_data['unitPrice'], individual_data['totalCostTk'])
        print(user_data)
        cursor.execute(insert_query, user_data)
        conn.commit()
        insert_query = "INSERT INTO BudgetPlanOriginal (ProjectID, SerialNo, Item, Quantity, UnitPrice , TotalCost) VALUES (%s, %s, %s, %s, %s , %s)"
        user_data = (project_id, individual_data['serialNo'], individual_data['item'],
                     individual_data['quantity'], individual_data['unitPrice'], individual_data['totalCostTk'])
        print(user_data)
        cursor.execute(insert_query, user_data)
        conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'message': 'Project Budget created successfully', 'statuscode': 201}), 201


# Route to fetch all gantt for a specific project
@project_blueprint.route('/get_self_project_gantt/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def get_self_project_gantt(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()
    # check if the current user is authorized to access projects
    cursor.execute("SELECT ProjectTitle FROM Projects WHERE ProjectID = %s AND CreatorUserID = %s",
                   (project_id, current_user_id))
    check = cursor.fetchone()
    # check current user's role is Admin/1 or not
    cursor.execute("SELECT RoleID FROM Users WHERE UserID = %s",
                   (current_user_id,))
    check_role = cursor.fetchone()
    print(check_role['RoleID'])
    if check_role['RoleID'] == 1 or check is not None:
        cursor.execute(
            "SELECT * FROM ActivityPlan WHERE ProjectID = %s", (project_id,))
        gantt_list = cursor.fetchall()
    else:
        return jsonify({'message': 'Unauthorized access to user projects Gantt', 'statuscode': 403}), 403

    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'gantt_list': gantt_list, 'statuscode': 200}), 200


# Route to fetch all gantt for a specific project
@project_blueprint.route('/get_self_project_gantt_original/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def get_self_project_gantt_original(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()
    # check if the current user is authorized to access projects
    cursor.execute("SELECT ProjectTitle FROM Projects WHERE ProjectID = %s AND CreatorUserID = %s",
                   (project_id, current_user_id))
    check = cursor.fetchone()
    # check current user's role is Admin/1 or not
    cursor.execute("SELECT RoleID FROM Users WHERE UserID = %s",
                   (current_user_id,))
    check_role = cursor.fetchone()

    cursor.execute("SELECT * FROM ProjectReportListWithMonitoringCommitteeID WHERE MonitoringCommitteeUserID = %s AND ProjectMonitoringReportID in (SELECT ProjectMonitoringReportID FROM ProjectMonitoringReport WHERE ProjectID = %s)", (current_user_id, project_id,))
    check_monitoring = cursor.fetchall()
    print("check_monitoring ==== ", check_monitoring)

    print(check_role['RoleID'])
    if check_role['RoleID'] == 1 or check is not None or check_monitoring is not None:
        cursor.execute(
            "SELECT * FROM ActivityPlanOriginal WHERE ProjectID = %s", (project_id,))
        gantt_list = cursor.fetchall()
    else:
        return jsonify({'message': 'Unauthorized access to user projects Gantt', 'statuscode': 403}), 403

    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'gantt_list_original': gantt_list, 'statuscode': 200}), 200


# Route to update project status & total points of specific project
@project_blueprint.route('/update_project_gantt/<int:project_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def update_project_gantt(project_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    for activity_data in data:
        # Convert date strings to the format MySQL accepts
        # Fri, 19 Apr 2024 00:00:00 GMT to 2024-04-19 00:00:00
        start_date = parser.parse(
            activity_data['StartDate']).strftime('%Y-%m-%d')
        end_date = parser.parse(activity_data['EndDate']).strftime('%Y-%m-%d')

        update_query = "UPDATE ActivityPlan SET Activity = %s , StartDate = %s , EndDate = %s , ActivityStatus = %s WHERE ProjectID = %s AND ActivityID = %s"
        project_data = (activity_data['Activity'], start_date, end_date,
                        activity_data['ActivityStatus'], activity_data['ProjectID'], activity_data['ActivityID'])
        cursor.execute(update_query, project_data)
        print(activity_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Gantt updated successfully', 'statuscode': 200}), 200


# Route to fetch all budget for a specific project
@project_blueprint.route('/get_self_project_budget/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def get_self_project_budget(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()
    # check if the current user is authorized to access projects
    cursor.execute("SELECT ProjectTitle FROM Projects WHERE ProjectID = %s AND CreatorUserID = %s",
                   (project_id, current_user_id))
    check = cursor.fetchone()
    # check current user's role is Admin/1 or not
    cursor.execute("SELECT RoleID FROM Users WHERE UserID = %s",
                   (current_user_id,))
    check_role = cursor.fetchone()
    if check_role['RoleID'] == 1 or check is not None:
        cursor.execute(
            "SELECT * FROM BudgetPlan WHERE ProjectID = %s", (project_id,))
        budget_list = cursor.fetchall()
    else:
        return jsonify({'message': 'Unauthorized access to user projects Gantt', 'statuscode': 403}), 403

    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'budget_list': budget_list, 'statuscode': 200}), 200


# Route to fetch all budget for a specific project
@project_blueprint.route('/get_self_project_budget_original/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def get_self_project_budget_original(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()
    # check if the current user is authorized to access projects
    cursor.execute("SELECT ProjectTitle FROM Projects WHERE ProjectID = %s AND CreatorUserID = %s",
                   (project_id, current_user_id))
    check = cursor.fetchone()
    # check current user's role is Admin/1 or not
    cursor.execute("SELECT RoleID FROM Users WHERE UserID = %s",
                   (current_user_id,))
    check_role = cursor.fetchone()

    cursor.execute("SELECT * FROM ProjectReportListWithMonitoringCommitteeID WHERE MonitoringCommitteeUserID = %s AND ProjectMonitoringReportID in (SELECT ProjectMonitoringReportID FROM ProjectMonitoringReport WHERE ProjectID = %s)", (current_user_id, project_id,))
    check_monitoring = cursor.fetchall()
    print("check_monitoring ==== ", check_monitoring)

    if check_role['RoleID'] == 1 or check is not None or check_monitoring is not None:
        cursor.execute(
            "SELECT * FROM BudgetPlanOriginal WHERE ProjectID = %s", (project_id,))
        budget_list = cursor.fetchall()
    else:
        return jsonify({'message': 'Unauthorized access to user projects Gantt', 'statuscode': 403}), 403

    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'budget_list_original': budget_list, 'statuscode': 200}), 200


# Route to update budget of specific project
@project_blueprint.route('/update_project_budget/<int:project_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def update_project_budget(project_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    for budget_data in data:
        update_query = "UPDATE BudgetPlan SET SerialNo = %s , Item = %s , Quantity = %s , UnitPrice = %s , TotalCost = %s WHERE ProjectID = %s AND BudgetID = %s"
        project_data = (budget_data['SerialNo'], budget_data['Item'], budget_data['Quantity'],
                        budget_data['UnitPrice'], budget_data['TotalCost'], budget_data['ProjectID'], budget_data['BudgetID'])
        cursor.execute(update_query, project_data)
        print(budget_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Budget updated successfully', 'statuscode': 200}), 200


# ==========================================  Project Related Routes END  =============================
