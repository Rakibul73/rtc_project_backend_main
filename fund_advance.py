from flask import Blueprint, jsonify, request
from flask_jwt_extended import get_jwt_identity, jwt_required
from auth_utils import origin_verifier, role_required
from db import get_db

fund_advance_blueprint = Blueprint('fund_advance', __name__)


# Route to get all projects
@fund_advance_blueprint.route('/get_all_myprojects_can_apply_advance_fund', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def get_all_myprojects_can_apply_advance_fund():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    current_user_id = get_jwt_identity()

    cursor.execute(
        "SELECT ProjectID , ProjectTitle , CodeByRTC FROM Projects WHERE ProjectStatus = 'Approved' AND CreatorUserID = %s", (current_user_id,))
    total_project_list_can_apply_fund = cursor.fetchall()
    print(total_project_list_can_apply_fund)

    cursor.close()
    conn.close()

    return jsonify({'projects': total_project_list_can_apply_fund, "statuscode": 200}), 200


# Route to get wether a project reviewed or not
@fund_advance_blueprint.route('/check_a_project_advance_fund_applied_or_not/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
# Only admin and supervisor can access this route
@role_required([1, 2, 3, 4, 5])
def check_a_project_advance_fund_applied_or_not(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT ProjectAdvanceFundID FROM ProjectAdvanceFund WHERE RequestForAdvanceFundDone > 0 AND ProjectID = %s", (project_id,))
    ProjectRequestFundCheck = cursor.fetchall()
    cursor.close()
    conn.close()
    if ProjectRequestFundCheck:
        return jsonify({'ProjectRequestAdvanceFundCheck': "Yes", "statuscode": 200}), 200
    else:
        return jsonify({'ProjectRequestAdvanceFundCheck': "No", "statuscode": 200}), 200


# Route to get a specific project for fund self
@fund_advance_blueprint.route('/get_specific_project_for_advance_fund_self/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4])
def get_specific_project_for_advance_fund_self(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    current_user_id = get_jwt_identity()
    # check if current user role is 1 or not
    cursor.execute("SELECT RoleID FROM Users WHERE UserID = %s",
                   (current_user_id,))
    current_user_role = cursor.fetchone()
    print(current_user_role)
    if current_user_role['RoleID'] == 1:
        cursor.execute("SELECT CodeByRTC , ProjectTitle , TotalBudgetOfResearchProposalTK , CreatorUserSealLocation , CreatorUserSignatureDate , CreatorUserSignatureLocation , ChairmanOfDepartmentSignatureDate , ChairmanOfDepartmentSignatureLocation , ChairmanOfDepartmentSealLocation , CreatorUserID  FROM Projects WHERE ProjectID = %s", (project_id,))
        project_data = cursor.fetchone()
    else:
        cursor.execute("SELECT CodeByRTC , ProjectTitle , TotalBudgetOfResearchProposalTK , CreatorUserSealLocation , CreatorUserSignatureDate , CreatorUserSignatureLocation , ChairmanOfDepartmentSignatureDate , ChairmanOfDepartmentSignatureLocation , ChairmanOfDepartmentSealLocation , CreatorUserID  FROM Projects WHERE ProjectID = %s AND CreatorUserID = %s", (project_id, current_user_id))
        project_data = cursor.fetchone()
    cursor.close()
    conn.close()
    if project_data:
        return jsonify({'project': project_data, 'statuscode': 200}), 200
    else:
        return jsonify({'message': 'project not found', 'statuscode': 404}), 404


# Route to create a new fund request for a project
@fund_advance_blueprint.route('/create_advance_fund_request_for_specific_project', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def create_advance_fund_request_for_specific_project():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    insert_query = "INSERT INTO ProjectAdvanceFund (ProjectID, TotalBudget, PiSignatureDate, RequestedAmount, ChairmanOfDepartmentSignatureDate, RequestForAdvanceFundDone , AdvanceFundRecievedDone , AdvanceFundSendDone) VALUES (%s, %s, %s, %s , %s , %s , %s , %s)"
    review_data = (data['ProjectID'], data['TotalBudget'], data['PiSignatureDate'], data['RequestedAmount'],
                   data['ChairmanOfDepartmentSignatureDate'], data['RequestForAdvanceFundDone'], data['AdvanceFundRecievedDone'], 0)
    cursor.execute(insert_query, review_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Advance Fund request created successfully', 'statuscode': 201}), 201


# Route to get a ProjectAdvanceFund detail for a specific project
@fund_advance_blueprint.route('/get_advance_fund_details_for_specific_project/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4])
def get_advance_fund_details_for_specific_project(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT ProjectID, TotalBudget, PiSignatureDate, RequestedAmount, ChairmanOfDepartmentSignatureDate, RequestForAdvanceFundDone , AdvanceFundRecievedDone , AdvanceFundSendDone FROM ProjectAdvanceFund WHERE ProjectID = %s", (project_id,))
    fund_data = cursor.fetchone()
    cursor.close()
    conn.close()
    if fund_data:
        return jsonify({'fund': fund_data, 'statuscode': 200}), 200
    else:
        return jsonify({'message': 'fund not found', 'statuscode': 404}), 404


# Route to get all projects
@fund_advance_blueprint.route('/get_all_my_advance_funded_projects', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def get_all_my_advance_funded_projects():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    current_user_id = get_jwt_identity()

    cursor.execute("SELECT ProjectID , CodeByRTC , ProjectTitle FROM Projects WHERE ProjectID IN (SELECT ProjectID FROM ProjectAdvanceFund WHERE ProjectID IN (SELECT ProjectID FROM Projects WHERE ProjectStatus = 'Approved' AND CreatorUserID = %s) AND AdvanceFundSendDone > 0)", (current_user_id,))
    funded_project = cursor.fetchall()

    cursor.close()
    conn.close()

    return jsonify({'projects': funded_project, "statuscode": 200}), 200


# Route to get wether a project reviewed or not
@fund_advance_blueprint.route('/check_a_project_advance_fund_confirmation_send_or_not/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
# Only admin and supervisor can access this route
@role_required([1, 2, 3, 4, 5])
def check_a_project_advance_fund_confirmation_send_or_not(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT ProjectAdvanceFundID FROM ProjectAdvanceFund WHERE AdvanceFundRecievedDone > 0 AND ProjectID = %s", (project_id,))
    ProjectConfirmFundCheck = cursor.fetchall()
    print(ProjectConfirmFundCheck)
    cursor.close()
    conn.close()
    if ProjectConfirmFundCheck:
        return jsonify({'ProjectConfirmAdvanceFundCheck': "Yes", "statuscode": 200}), 200
    else:
        return jsonify({'ProjectConfirmAdvanceFundCheck': "No", "statuscode": 200}), 200


# Route to update a specific project fund recieved confirmation AdvanceFundRecievedDone 0 = not Received , 1 = 1st Received
@fund_advance_blueprint.route('/update_confirm_advance_fund_recieved/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def update_confirm_advance_fund_recieved(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        "UPDATE ProjectAdvanceFund SET AdvanceFundRecievedDone = 1 WHERE ProjectID = %s", (project_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Advance recieved confirm updated successfully', 'statuscode': 200}), 200


# Route to get total number of all dashboard
@fund_advance_blueprint.route('/get_admin_fund_dashboard', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1])
def get_admin_fund_dashboard():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT ProjectID FROM ProjectAdvanceFund WHERE AdvanceFundSendDone > 0")
    funded_projects = cursor.fetchall()
    print(funded_projects)
    funded_projects = len(funded_projects)

    cursor.execute(
        "SELECT ProjectID FROM ProjectAdvanceFund WHERE RequestForAdvanceFundDone > 0")
    fund_request_queue = cursor.fetchall()
    print(fund_request_queue)
    fund_request_queue = len(fund_request_queue) - funded_projects

    cursor.execute(
        "SELECT ProjectID FROM ProjectAdvanceFund WHERE AdvanceFundRecievedDone > 0")
    fund_confirmation_recieved = cursor.fetchall()
    print(fund_confirmation_recieved)
    fund_confirmation_recieved = len(fund_confirmation_recieved)

    cursor.close()
    conn.close()

    return jsonify({
        'fund_request_queue': fund_request_queue,
        'funded_projects': funded_projects,
        'fund_confirmation_recieved': fund_confirmation_recieved,
        'statuscode': 200
    }), 200


# Route to get all projects
@fund_advance_blueprint.route('/get_admin_advance_fund_queue_list', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1])
def get_admin_advance_fund_queue_list():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT * FROM ProjectAdvanceFund WHERE RequestForAdvanceFundDone > 0 AND AdvanceFundSendDone = 0")
    projects_fund_queue = cursor.fetchall()
    print(projects_fund_queue)

    cursor.close()
    conn.close()

    return jsonify({'projects_advance_fund_queue': projects_fund_queue, "statuscode": 200}), 200


# Route to get wether a project reviewed or not
@fund_advance_blueprint.route('/check_a_project_advance_fund_send_or_not/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
# Only admin and supervisor can access this route
@role_required([1, 2, 3, 4, 5])
def check_a_project_advance_fund_send_or_not(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute(
        "SELECT ProjectAdvanceFundID FROM ProjectAdvanceFund WHERE AdvanceFundSendDone > 0 AND ProjectID = %s", (project_id,))
    ProjectFundSendCheck = cursor.fetchall()
    cursor.close()
    conn.close()
    if ProjectFundSendCheck:
        return jsonify({'ProjectAdvanceFundSendCheck': "Yes", "statuscode": 200}), 200
    else:
        return jsonify({'ProjectAdvanceFundSendCheck': "No", "statuscode": 200}), 200


# Route to update a specific project fund send AdvanceFundSendDone 0 = not Received , 1 = 1st Received
@fund_advance_blueprint.route('/update_advance_fund_send/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def update_advance_fund_send(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        "UPDATE ProjectAdvanceFund SET AdvanceFundSendDone = 1 WHERE ProjectID = %s", (project_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Advance fund send confirm updated successfully', 'statuscode': 200}), 200


# Route to get all projects
@fund_advance_blueprint.route('/get_admin_advance_fund_confirm_list', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1])
def get_admin_advance_fund_confirm_list():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT p.ProjectID, p.ProjectTitle, p.CodeByRTC, paf.RequestedAmount, paf.TotalBudget FROM Projects p JOIN ProjectAdvanceFund paf ON p.ProjectID = paf.ProjectID WHERE paf.AdvanceFundRecievedDone > 0")
    projects_fund_confirm = cursor.fetchall()
    print(projects_fund_confirm)

    cursor.close()
    conn.close()

    return jsonify({'projects_advance_fund_confirm': projects_fund_confirm, "statuscode": 200}), 200
