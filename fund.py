from flask import Blueprint, jsonify, request
from flask_jwt_extended import get_jwt_identity, jwt_required
from auth_utils import role_required
from db import get_db

fund_blueprint = Blueprint('fund', __name__)


# Route to get total number of all dashboard
@fund_blueprint.route('/get_my_fund_dashboard', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])  
def get_my_fund_dashboard():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    current_user_id = get_jwt_identity()
    
    cursor.execute("SELECT ProjectID FROM Projects WHERE ProjectStatus = 'Approved' AND CreatorUserID = %s" , (current_user_id,))
    total_project_list_can_apply_fund = cursor.fetchall()
    print(total_project_list_can_apply_fund)
    total_project_can_apply_fund = len(total_project_list_can_apply_fund)
    
    project_list_can_apply_fund = [project['ProjectID'] for project in total_project_list_can_apply_fund]
    print(project_list_can_apply_fund)
    cursor.execute("SELECT COUNT(ProjectID) AS total_project_applied_fund FROM ProjectFund WHERE ProjectID IN ({}) AND RequestForFundDone > 0".format(
            ', '.join(['%s']*len(project_list_can_apply_fund))), project_list_can_apply_fund)
    total_project_applied_fund = cursor.fetchone()
    print(total_project_applied_fund['total_project_applied_fund'])
    
    cursor.execute("SELECT COUNT(ProjectID) AS total_project_fund_recieved FROM ProjectFund WHERE ProjectID IN ({}) AND FundSendDone > 0".format(
            ', '.join(['%s']*len(project_list_can_apply_fund))), project_list_can_apply_fund)
    total_project_fund_recieved = cursor.fetchone()
    print(total_project_fund_recieved['total_project_fund_recieved'])
    
    cursor.close()
    conn.close()
    
    return jsonify({
        'total_project_can_apply_fund': total_project_can_apply_fund,
        'total_project_applied_fund': total_project_applied_fund['total_project_applied_fund'],
        'total_project_fund_recieved': total_project_fund_recieved['total_project_fund_recieved'],
        'statuscode' : 200
    }) , 200


# Route to get all projects
@fund_blueprint.route('/get_all_myprojects_can_apply_fund', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])  
def get_all_myprojects_can_apply_fund():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    current_user_id = get_jwt_identity()
    
    cursor.execute("SELECT ProjectID , ProjectTitle , CodeByRTC FROM Projects WHERE ProjectStatus = 'Approved' AND CreatorUserID = %s" , (current_user_id,))
    total_project_list_can_apply_fund = cursor.fetchall()
    print(total_project_list_can_apply_fund)
    
    cursor.close()
    conn.close()
    
    return jsonify({'projects': total_project_list_can_apply_fund  , "statuscode" : 200}) , 200




# Route to get wether a project reviewed or not
@fund_blueprint.route('/check_a_project_fund_applied_or_not/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def check_a_project_fund_applied_or_not(project_id ):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT ProjectFundID FROM ProjectFund WHERE RequestForFundDone > 0 AND ProjectID = %s" , (project_id,))
    ProjectRequestFundCheck = cursor.fetchall()
    cursor.close()
    conn.close()
    if ProjectRequestFundCheck:
        return jsonify({'ProjectRequestFundCheck': "Yes" , "statuscode" : 200}) , 200
    else:
        return jsonify({'ProjectRequestFundCheck': "No" , "statuscode" : 200}) , 200
    



# Route to get a specific project for fund self
@fund_blueprint.route('/get_specific_project_for_fund_self/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4])
def get_specific_project_for_fund_self(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    current_user_id = get_jwt_identity()
    cursor.execute("SELECT CodeByRTC , ProjectTitle , TotalBudgetOfResearchProposalTK , CreatorUserSealLocation , CreatorUserSignatureDate , CreatorUserSignatureLocation , ChairmanOfDepartmentSignatureDate , ChairmanOfDepartmentSignatureLocation , ChairmanOfDepartmentSealLocation  FROM Projects WHERE ProjectID = %s AND CreatorUserID = %s", (project_id, current_user_id))
    project_data = cursor.fetchone()
    cursor.close()
    conn.close()
    if project_data:
        return jsonify({'project': project_data , 'statuscode' : 200}), 200
    else:
        return jsonify({'message': 'project not found' , 'statuscode' : 404}), 404



# Route to create a new fund request for a project
@fund_blueprint.route('/create_fund_request_for_specific_project', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])
def create_fund_request_for_specific_project():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    insert_query = "INSERT INTO ProjectFund (ProjectID, TotalBudget, HonorariumOfPI, HonorariumOfCoPI , PiSignatureDate, ChairmanOfDepartmentSignatureDate, TotalHonorarium, RequestForFundDone , FundRecievedDone , FundSendDone) VALUES (%s, %s, %s, %s , %s , %s , %s , %s , %s , %s)"
    review_data = (data['ProjectID'], data['TotalBudget'], data['HonorariumOfPI'], data['HonorariumOfCoPI'] , data['PiSignatureDate'] , data['ChairmanOfDepartmentSignatureDate'] , data['TotalHonorarium'] , data['RequestForFundDone'] , data['FundRecievedDone'] , 0)
    cursor.execute(insert_query, review_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Fund request created successfully' , 'statuscode' : 201}), 201


# Route to get a ProjectFund detail for a specific project
@fund_blueprint.route('/get_fund_details_for_specific_project/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4])
def get_fund_details_for_specific_project(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT ProjectID, TotalBudget, HonorariumOfPI, HonorariumOfCoPI , PiSignatureDate, ChairmanOfDepartmentSignatureDate, TotalHonorarium, RequestedAmount,  RequestForFundDone , FundRecievedDone , FundSendDone FROM ProjectFund WHERE ProjectID = %s", (project_id,))
    fund_data = cursor.fetchone()
    cursor.close()
    conn.close()
    if fund_data:
        return jsonify({'fund': fund_data , 'statuscode' : 200}), 200
    else:
        return jsonify({'message': 'fund not found' , 'statuscode' : 404}), 404




# Route to get all projects
@fund_blueprint.route('/get_all_my_funded_projects', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])  
def get_all_my_funded_projects():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    current_user_id = get_jwt_identity()
    
    cursor.execute("SELECT ProjectID FROM Projects WHERE ProjectStatus = 'Approved' AND CreatorUserID = %s" , (current_user_id,))
    my_project = cursor.fetchall()
    print("my_project" , my_project)
    project_list = [project['ProjectID'] for project in my_project]
    
    print("project_list" , project_list)
    
    cursor.execute("SELECT ProjectID FROM ProjectFund WHERE ProjectID IN ({}) AND FundSendDone > 0".format(
            ', '.join(['%s']*len(project_list))), project_list)
    
    funded_project = cursor.fetchall()
    print(funded_project)
    
    project_list = [project['ProjectID'] for project in funded_project]
    print("ccccccccccccccccccccccccc ", project_list)
    
    cursor.execute("SELECT ProjectID , CodeByRTC , ProjectTitle FROM Projects WHERE ProjectID IN ({})".format(
            ', '.join(['%s']*len(project_list))), project_list)
    funded_project = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    if not funded_project:  # Check if funded_project is empty
        return jsonify({'message': 'No funded projects found', 'statuscode': 404}), 404
    
    return jsonify({'projects': funded_project  , "statuscode" : 200}) , 200





# Route to get wether a project reviewed or not
@fund_blueprint.route('/check_a_project_fund_confirmation_send_or_not/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def check_a_project_fund_confirmation_send_or_not(project_id ):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT ProjectFundID FROM ProjectFund WHERE FundRecievedDone > 0 AND ProjectID = %s" , (project_id,))
    ProjectConfirmFundCheck = cursor.fetchall()
    print(ProjectConfirmFundCheck)
    cursor.close()
    conn.close()
    if ProjectConfirmFundCheck:
        return jsonify({'ProjectConfirmFundCheck': "Yes" , "statuscode" : 200}) , 200
    else:
        return jsonify({'ProjectConfirmFundCheck': "No" , "statuscode" : 200}) , 200
    




# Route to update a specific project fund recieved confirmation FundRecievedDone 0 = not Received , 1 = 1st Received
@fund_blueprint.route('/update_confirm_fund_recieved/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def update_confirm_fund_recieved(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("UPDATE ProjectFund SET FundRecievedDone = 1 WHERE ProjectID = %s" , (project_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project Fund recieved confirm updated successfully' , 'statuscode' : 200}), 200



