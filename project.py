from flask import request, jsonify , Blueprint
from auth_utils import role_required
from db import get_db # local module
from flask_jwt_extended import jwt_required

project_blueprint = Blueprint('project', __name__)

# ==========================================  Project Related Routes START =============================


# Route to get total number of projects
@project_blueprint.route('/get_total_number_of_projects', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def get_total_number_of_projects():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT COUNT(*) AS total_projects FROM Projects")
    total_projects = cursor.fetchone()
    cursor.close()
    conn.close()
    print(total_projects['total_projects'])
    return jsonify({'total_projects': total_projects['total_projects'] , "statuscode" : 200}) , 200



# Route to get all projects
@project_blueprint.route('/projects', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def get_all_projects():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM Projects")
    project_list = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return jsonify({'projects': project_list  , "statuscode" : 200}) , 200


# Route to create a new project
@project_blueprint.route('/create_projects', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def create_project():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    
    # Validate input data
    if 'ProjectTitle' not in data or 'CreatorUserID' not in data:
        return jsonify({'error': 'Incomplete data. Title, CreatorUserID are required.' , "statuscode" : 400}), 400

    insert_query = "INSERT INTO Projects (CodeByRTC, DateRecieved, ProjectTitle, NatureOfResearchProposal , NameOfCollaboratingDepartments , AddressOfCollaboratingDepartments , NameOfCollaboratingInstitutes , AddressOfCollaboratingInstitutes ,  LocationOfFieldActivities , DurationOfResearchProjectAnnual , DurationOfResearchProjectLongTerm , TotalBudgetOfResearchProposalTK , ExternalAgencyFundingSource , ExternalAgencyFundingSourcesName , ExternalAgencyFundingSourcesSubmissionDate , CommitmentOtherResearchProject , CommitmentOtherResearchProjectName , ProjectDescription , ProjectObjective , PstuNationalGoal , PriorResearchOverview , Methodology , MethodologyFileLocation , ExpectedOutput , SuccessIndicators , Beneficiaries , ManPowerExisting , ManPowerRequired , SmallEquipmentExisting , SmallEquipmentRequired ,ResearchMaterialsExisting ,  ResearchMaterialsRequired ,OtherExisting , OtherRequired , CreatorUserID , CoPiUserID , StudentUserID , CreatorUserSealLocation , CreatorUserSignatureLocation , CreatorUserSignatureDate , ChairmanOfDepartmentComment , ChairmanOfDepartmentSealLocation , ChairmanOfDepartmentSignatureLocation , ChairmanOfDepartmentSignatureDate , ProjectStatus , TotalPoints) VALUES (%s, %s , %s , %s , %s , %s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s , %s )"
    user_data = ( data['CodeByRTC'], data['DateRecieved'], data['ProjectTitle'], data['NatureOfResearchProposal'], data['NameOfCollaboratingDepartments'], data['AddressOfCollaboratingDepartments'], data['NameOfCollaboratingInstitutes'], data['AddressOfCollaboratingInstitutes'], data['LocationOfFieldActivities'], data['DurationOfResearchProjectAnnual'], data['DurationOfResearchProjectLongTerm'], data['TotalBudgetOfResearchProposalTK'], data['ExternalAgencyFundingSource'], data['ExternalAgencyFundingSourcesName'], data['ExternalAgencyFundingSourcesSubmissionDate'], data['CommitmentOtherResearchProject'], data['CommitmentOtherResearchProjectName'], data['ProjectDescription'], data['ProjectObjective'], data['PstuNationalGoal'], data['PriorResearchOverview'], data['Methodology'], data['MethodologyFileLocation'], data['ExpectedOutput'], data['SuccessIndicators'], data['Beneficiaries'], data['ManPowerExisting'], data['ManPowerRequired'], data['SmallEquipmentExisting'], data['SmallEquipmentRequired'], data['ResearchMaterialsExisting'], data['ResearchMaterialsRequired'], data['OtherExisting'], data['OtherRequired'], data['CreatorUserID'], data['CoPiUserID'], data['StudentUserID'], data['CreatorUserSealLocation'], data['CreatorUserSignatureLocation'], data['CreatorUserSignatureDate'], data['ChairmanOfDepartmentComment'], data['ChairmanOfDepartmentSealLocation'], data['ChairmanOfDepartmentSignatureLocation'], data['ChairmanOfDepartmentSignatureDate'] , "Pending", 0)
    cursor.execute(insert_query, user_data)
    conn.commit()
    
    # ProjectStatus = "Pending" , "Approved" , "Rejected" , "Running" , "Completed"
    # After successfully inserting into projects table, update projectlistwithuserid
    # Assuming project_id is auto-incremented in projects table
    project_id = cursor.lastrowid
    # Insert into projectlistwithuserid
    project_list_query = "INSERT INTO ProjectListWithUserID (UserID, ProjectID , ProjectTitle ) VALUES (%s, %s , %s )"
    project_list_data = (data['CreatorUserID'] , project_id, data['ProjectTitle'] )
    cursor.execute(project_list_query, project_list_data)
    conn.commit()
    
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project created successfully' , 'statuscode' : 201}), 201


# Route to get a specific project
@project_blueprint.route('/projects/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4])
def get_specific_project(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Projects WHERE ProjectID = %s", (project_id,))
    project_data = cursor.fetchone()
    cursor.close()
    conn.close()
    if project_data:
        return jsonify({'project': project_data , 'statuscode' : 200}), 200
    else:
        return jsonify({'message': 'project not found' , 'statuscode' : 404}), 404


# Route to update all fields of a project only if user is admin
@project_blueprint.route('/update_project_admin/<int:project_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def update_project_admin(project_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    update_query = "UPDATE Projects SET CodeByRTC = %s , DateRecieved = %s , ProjectTitle = %s , NatureOfResearchProposal = %s , NameOfCollaboratingDepartments = %s , AddressOfCollaboratingDepartments = %s , NameOfCollaboratingInstitutes = %s , AddressOfCollaboratingInstitutes = %s ,  LocationOfFieldActivities = %s , DurationOfResearchProjectAnnual = %s , DurationOfResearchProjectLongTerm = %s , TotalBudgetOfResearchProposalTK = %s , ExternalAgencyFundingSourcesName = %s , ExternalAgencyFundingSourcesSubmissionDate = %s , ProjectDescription = %s , ProjectAbstract = %s , ProjectObjective = %s , PstuNationalGoal = %s , PriorResearchOverview = %s , Methodology = %s , ExpectedOutput = %s , SuccessIndicators = %s , Beneficiaries = %s , ManPowerExisting = %s , ManPowerRequired = %s , SmallEquipmentExisting = %s , SmallEquipmentRequired ,ResearchMaterialsExisting = %s ,  ResearchMaterialsRequired ,OtherExisting = %s , OtherRequired = %s , ResearchCarriedOutPlace = %s , CreatorUserID = %s , CreatorUserDate = %s , CreatorUserSealLocation = %s , ChairmanOfDepartmentComment = %s , ChairmanOfDepartmentSignatureLocation = %s , ChairmanOfDepartmentSignatureDate = %s , ResultsAndDiscussion = %s , KeyAchievements = %s , ProjectStatus = %s , TotalPoints = %s , ProjectSoftCopyLocation = %s  WHERE ProjectID = %s"
    user_data = ( data['CodeByRTC'], data['DateRecieved'], data['ProjectTitle'], data['NatureOfResearchProposal'] , data["NameOfCollaboratingDepartments"] , data["AddressOfCollaboratingDepartments"] , data["NameOfCollaboratingInstitutes"] , data["AddressOfCollaboratingInstitutes"] , data[" LocationOfFieldActivities"] , data["DurationOfResearchProjectAnnual"] , data["DurationOfResearchProjectLongTerm"] , data["TotalBudgetOfResearchProposalTK"] , data["ExternalAgencyFundingSourcesName"] , data["ExternalAgencyFundingSourcesSubmissionDate"] , data["ProjectDescription"] , data["ProjectAbstract"] , data["ProjectObjective"] , data["PstuNationalGoal"] , data["PriorResearchOverview"] , data["Methodology"] , data["ExpectedOutput"] , data["SuccessIndicators"] , data["Beneficiaries"] , data["ManPowerExisting"] , data["ManPowerRequired"] , data["SmallEquipmentExisting"] , data["SmallEquipmentRequired ,ResearchMaterialsExisting"] , data[" ResearchMaterialsRequired ,OtherExisting"] , data["OtherRequired"] , data["ResearchCarriedOutPlace"] , data["CreatorUserID"] , data["CreatorUserDate"] , data["CreatorUserSealLocation"] , data["ChairmanOfDepartmentComment"] , data["ChairmanOfDepartmentSignatureLocation"] , data["ChairmanOfDepartmentSignatureDate"] , data["ResultsAndDiscussion"] , data["KeyAchievements"] , data["ProjectStatus"] , data["TotalPoints"] , data["ProjectSoftCopyLocation"] , project_id)
    
    cursor.execute(update_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project updated successfully', 'statuscode' : 200}), 200


# Route to delete a project
@project_blueprint.route('/projects/<int:project_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def delete_project(project_id):
    conn = get_db()
    cursor = conn.cursor()
    # Remove from ActivityPlan table based on ProjectID
    delete_activity_query = "DELETE FROM ActivityPlan WHERE ProjectID = %s"
    cursor.execute(delete_activity_query, (project_id,))
    # Remove from Review table based on ProjectID
    delete_review_query = "DELETE FROM Review WHERE ProjectID = %s"
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
    return jsonify({'message': 'Project with id ' + str(project_id) + ' deleted successfully' , 'statuscode' : 200}), 200


# Route to delete multiple projects by IDs
@project_blueprint.route('/projects/delete_multiple_projects', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def delete_multiple_projects():
    try:
        # Get the list of project IDs from the request body
        data = request.get_json()
        project_ids = data.get('project_ids', [])

        if not project_ids:
            return jsonify({'error': 'No project IDs provided'}), 400

        conn = get_db()
        cursor = conn.cursor()

        for project_id in project_ids:
            # Remove from ActivityPlan table based on ProjectID
            delete_activity_query = "DELETE FROM ActivityPlan WHERE ProjectID = %s"
            cursor.execute(delete_activity_query, (project_id,))
            # Remove from Review table based on ProjectID
            delete_review_query = "DELETE FROM Review WHERE ProjectID = %s"
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

        return jsonify({'message': 'Projects deleted successfully', 'statuscode': 200}), 200
    except Exception as e:
        return jsonify({'error': str(e), 'statuscode': 500}), 500




# Route to update basic info of a project of self 
@project_blueprint.route('/update_project/<int:project_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4])
def update_project(project_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    update_query = "UPDATE Projects SET CodeByRTC = %s , DateRecieved = %s , ProjectTitle = %s , NatureOfResearchProposal = %s , NameOfCollaboratingDepartments = %s , AddressOfCollaboratingDepartments = %s , NameOfCollaboratingInstitutes = %s , AddressOfCollaboratingInstitutes = %s , LocationOfFieldActivities = %s , DurationOfResearchProjectAnnual = %s , DurationOfResearchProjectLongTerm = %s , TotalBudgetOfResearchProposalTK = %s , ExternalAgencyFundingSource = %s , ExternalAgencyFundingSourcesName = %s , ExternalAgencyFundingSourcesSubmissionDate = %s , CommitmentOtherResearchProject = %s , CommitmentOtherResearchProjectName = %s , ProjectDescription = %s , ProjectObjective = %s , PstuNationalGoal = %s , PriorResearchOverview = %s , Methodology = %s , MethodologyFileLocation = %s , ExpectedOutput = %s , SuccessIndicators = %s , Beneficiaries = %s , ManPowerExisting = %s , ManPowerRequired = %s , SmallEquipmentExisting = %s , SmallEquipmentRequired = %s , ResearchMaterialsExisting = %s , ResearchMaterialsRequired = %s , OtherExisting = %s , OtherRequired = %s , CreatorUserID = %s , CoPiUserID = %s , StudentUserID = %s , CreatorUserSealLocation = %s , CreatorUserSignatureLocation = %s , CreatorUserSignatureDate = %s , ChairmanOfDepartmentComment = %s , ChairmanOfDepartmentSealLocation = %s , ChairmanOfDepartmentSignatureLocation = %s , ChairmanOfDepartmentSignatureDate = %s , ProjectStatus = %s , ProjectSoftCopyLocation = %s  WHERE ProjectID = %s"
    project_data = ( data['CodeByRTC'] , data['DateRecieved'] , data['ProjectTitle'] , data['NatureOfResearchProposal'] , data['NameOfCollaboratingDepartments'] , data['AddressOfCollaboratingDepartments'] , data['NameOfCollaboratingInstitutes'] , data['AddressOfCollaboratingInstitutes'] , data['LocationOfFieldActivities'] , data['DurationOfResearchProjectAnnual'] , data['DurationOfResearchProjectLongTerm'] , data['TotalBudgetOfResearchProposalTK'] , data['ExternalAgencyFundingSource'] , data['ExternalAgencyFundingSourcesName'] , data['ExternalAgencyFundingSourcesSubmissionDate'] , data['CommitmentOtherResearchProject'] , data['CommitmentOtherResearchProjectName'] , data['ProjectDescription'] , data['ProjectObjective'] , data['PstuNationalGoal'] , data['PriorResearchOverview'] , data['Methodology'] , data['MethodologyFileLocation'] , data['ExpectedOutput'] , data['SuccessIndicators'] , data['Beneficiaries'] , data['ManPowerExisting'] , data['ManPowerRequired'] , data['SmallEquipmentExisting'] , data['SmallEquipmentRequired'] , data['ResearchMaterialsExisting'] , data['ResearchMaterialsRequired'] , data['OtherExisting'] , data['OtherRequired'] , data['CreatorUserID'] , data['CoPiUserID'] , data['StudentUserID'] , data['CreatorUserSealLocation'] , data['CreatorUserSignatureLocation'] , data['CreatorUserSignatureDate'] , data['ChairmanOfDepartmentComment'] , data['ChairmanOfDepartmentSealLocation'] , data['ChairmanOfDepartmentSignatureLocation'] , data['ChairmanOfDepartmentSignatureDate'] , data['ProjectStatus'] , data['ProjectSoftCopyLocation'] , project_id)
    
    cursor.execute(update_query, project_data)
    
    project_list_query = "UPDATE ProjectListWithUserID SET ProjectTitle = %s WHERE ProjectID = %s"
    project_list_data = (data['ProjectTitle'] , project_id)
    cursor.execute(project_list_query, project_list_data)
    
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project updated successfully', 'statuscode' : 200}), 200


# ==========================================  Project Related Routes END  =============================
