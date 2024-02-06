from flask import request, jsonify , Blueprint
from db import get_db # local module
from flask_jwt_extended import jwt_required

project_blueprint = Blueprint('project', __name__)

# ==========================================  Project Related Routes START =============================



# Route to get all projects
@project_blueprint.route('/projects', methods=['GET'])
@jwt_required()  # Protect the route with JWT
def get_all_projects():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM projects")
    project_list = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return jsonify({'projects': project_list})


# Route to create a new project
@project_blueprint.route('/projects', methods=['POST'])
@jwt_required()  # Protect the route with JWT
def create_project():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    
    # Validate input data
    if 'ProjectTitle' not in data or 'CreatorUserID' not in data:
        return jsonify({'error': 'Incomplete data. Title, CreatorUserID are required.'}), 400

    insert_query = "INSERT INTO projects (CodeByRTC, DateRecieved, ProjectTitle, NatureOfResearchProposal , NameOfCollaboratingDepartments , AddressOfCollaboratingDepartments , NameOfCollaboratingInstitutes , AddressOfCollaboratingInstitutes ,  LocationOfFieldActivities , DurationOfResearchProjectAnnual , DurationOfResearchProjectLongTerm , TotalBudgetOfResearchProposalTK , ExternalAgencyFundingSourcesName , ExternalAgencyFundingSourcesSubmissionDate , ProjectDescription , ProjectAbstract , ProjectObjective , PstuNationalGoal , PriorResearchOverview , Methodology , ExpectedOutput , SuccessIndicators , Beneficiaries , ManPowerExisting , ManPowerRequired , SmallEquipmentExisting , SmallEquipmentRequired ,ResearchMaterialsExisting ,  ResearchMaterialsRequired ,OtherExisting , OtherRequired , ResearchCarriedOutPlace , CreatorUserID , CreatorUserDate , CreatorUserSealLocation , ChairmanOfDepartmentComment , ChairmanOfDepartmentSignatureLocation , ChairmanOfDepartmentSignatureDate , ResultsAndDiscussion , KeyAchievements , ProjectStatus , TotalPoints , ProjectSoftCopyLocation  ) VALUES (%s, %s , %s , %s , %s , %s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s , %s ,%s, %s , %s , %s )"
    user_data = ( data['CodeByRTC'], data['DateRecieved'], data['ProjectTitle'], data['NatureOfResearchProposal'] , data["NameOfCollaboratingDepartments"] , data["AddressOfCollaboratingDepartments"] , data["NameOfCollaboratingInstitutes"] , data["AddressOfCollaboratingInstitutes"] , data[" LocationOfFieldActivities"] , data["DurationOfResearchProjectAnnual"] , data["DurationOfResearchProjectLongTerm"] , data["TotalBudgetOfResearchProposalTK"] , data["ExternalAgencyFundingSourcesName"] , data["ExternalAgencyFundingSourcesSubmissionDate"] , data["ProjectDescription"] , data["ProjectAbstract"] , data["ProjectObjective"] , data["PstuNationalGoal"] , data["PriorResearchOverview"] , data["Methodology"] , data["ExpectedOutput"] , data["SuccessIndicators"] , data["Beneficiaries"] , data["ManPowerExisting"] , data["ManPowerRequired"] , data["SmallEquipmentExisting"] , data["SmallEquipmentRequired ,ResearchMaterialsExisting"] , data[" ResearchMaterialsRequired ,OtherExisting"] , data["OtherRequired"] , data["ResearchCarriedOutPlace"] , data["CreatorUserID"] , data["CreatorUserDate"] , data["CreatorUserSealLocation"] , data["ChairmanOfDepartmentComment"] , data["ChairmanOfDepartmentSignatureLocation"] , data["ChairmanOfDepartmentSignatureDate"] , data["ResultsAndDiscussion"] , data["KeyAchievements"] , data["ProjectStatus"] , data["TotalPoints"] , data["ProjectSoftCopyLocation"] )
    cursor.execute(insert_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'User created successfully'}), 201


# Route to get a specific project
@project_blueprint.route('/projects/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
def get_specific_project(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM projects WHERE ProjectID = %s", (project_id,))
    project_data = cursor.fetchone()
    cursor.close()
    conn.close()
    if project_data:
        return jsonify({'project': project_data})
    else:
        return jsonify({'message': 'project not found'}), 404


# Route to update a project
@project_blueprint.route('/projects/<int:project_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
def update_project(project_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    update_query = "UPDATE projects SET CodeByRTC = %s , DateRecieved = %s , ProjectTitle = %s , NatureOfResearchProposal = %s , NameOfCollaboratingDepartments = %s , AddressOfCollaboratingDepartments = %s , NameOfCollaboratingInstitutes = %s , AddressOfCollaboratingInstitutes = %s ,  LocationOfFieldActivities = %s , DurationOfResearchProjectAnnual = %s , DurationOfResearchProjectLongTerm = %s , TotalBudgetOfResearchProposalTK = %s , ExternalAgencyFundingSourcesName = %s , ExternalAgencyFundingSourcesSubmissionDate = %s , ProjectDescription = %s , ProjectAbstract = %s , ProjectObjective = %s , PstuNationalGoal = %s , PriorResearchOverview = %s , Methodology = %s , ExpectedOutput = %s , SuccessIndicators = %s , Beneficiaries = %s , ManPowerExisting = %s , ManPowerRequired = %s , SmallEquipmentExisting = %s , SmallEquipmentRequired ,ResearchMaterialsExisting = %s ,  ResearchMaterialsRequired ,OtherExisting = %s , OtherRequired = %s , ResearchCarriedOutPlace = %s , CreatorUserID = %s , CreatorUserDate = %s , CreatorUserSealLocation = %s , ChairmanOfDepartmentComment = %s , ChairmanOfDepartmentSignatureLocation = %s , ChairmanOfDepartmentSignatureDate = %s , ResultsAndDiscussion = %s , KeyAchievements = %s , ProjectStatus = %s , TotalPoints = %s , ProjectSoftCopyLocation = %s  WHERE ProjectID = %s"
    user_data = ( data['CodeByRTC'], data['DateRecieved'], data['ProjectTitle'], data['NatureOfResearchProposal'] , data["NameOfCollaboratingDepartments"] , data["AddressOfCollaboratingDepartments"] , data["NameOfCollaboratingInstitutes"] , data["AddressOfCollaboratingInstitutes"] , data[" LocationOfFieldActivities"] , data["DurationOfResearchProjectAnnual"] , data["DurationOfResearchProjectLongTerm"] , data["TotalBudgetOfResearchProposalTK"] , data["ExternalAgencyFundingSourcesName"] , data["ExternalAgencyFundingSourcesSubmissionDate"] , data["ProjectDescription"] , data["ProjectAbstract"] , data["ProjectObjective"] , data["PstuNationalGoal"] , data["PriorResearchOverview"] , data["Methodology"] , data["ExpectedOutput"] , data["SuccessIndicators"] , data["Beneficiaries"] , data["ManPowerExisting"] , data["ManPowerRequired"] , data["SmallEquipmentExisting"] , data["SmallEquipmentRequired ,ResearchMaterialsExisting"] , data[" ResearchMaterialsRequired ,OtherExisting"] , data["OtherRequired"] , data["ResearchCarriedOutPlace"] , data["CreatorUserID"] , data["CreatorUserDate"] , data["CreatorUserSealLocation"] , data["ChairmanOfDepartmentComment"] , data["ChairmanOfDepartmentSignatureLocation"] , data["ChairmanOfDepartmentSignatureDate"] , data["ResultsAndDiscussion"] , data["KeyAchievements"] , data["ProjectStatus"] , data["TotalPoints"] , data["ProjectSoftCopyLocation"] , project_id)
    
    cursor.execute(update_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project updated successfully'})


# Route to delete a project
@project_blueprint.route('/projects/<int:project_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
def delete_project(project_id):
    conn = get_db()
    cursor = conn.cursor()
    delete_query = "DELETE FROM projects WHERE ProjectID = %s"
    cursor.execute(delete_query, (project_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project with id ' + str(project_id) + ' deleted successfully'})

# ==========================================  Project Related Routes END  =============================
