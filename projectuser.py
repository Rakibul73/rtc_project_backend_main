import asyncio
from flask import request, jsonify , Blueprint
from flask_jwt_extended import get_jwt_identity, jwt_required
from auth_utils import role_required
from db import get_db  #  local module 


projectuser_blueprint = Blueprint('projectuser', __name__)

# ==========================================  Project_User Related Routes START =============================

# Route to get total number of all dashboard
@projectuser_blueprint.route('/get_total_number_of_all_dashboard', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
async def get_total_number_of_all_dashboard():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    async def execute_query(query):
        cursor.execute(query)
        result = cursor.fetchone()
        return result
    
    async_queries = [
        execute_query("SELECT COUNT(*) AS total_users FROM Users"),
        execute_query("SELECT COUNT(*) AS total_projects FROM Projects"),
        execute_query("SELECT COUNT(*) AS total_admin FROM Users WHERE RoleID = 1"),
        execute_query("SELECT COUNT(*) AS total_project_report FROM Projects WHERE ProjectSoftCopyLocation IS NOT NULL"),
        execute_query("SELECT COUNT(*) AS total_teacher FROM Users WHERE RoleID = 4"),
        execute_query("SELECT COUNT(*) AS total_researcher FROM Users WHERE RoleID = 2"),
        execute_query("SELECT COUNT(*) AS total_reviewer FROM Users WHERE RoleID = 3"),
        execute_query("SELECT COUNT(*) AS total_student FROM Users WHERE RoleID = 5")
    ]

    results = await asyncio.gather(*async_queries)

    total_users = results[0]['total_users']
    total_projects = results[1]['total_projects']
    total_admin = results[2]['total_admin']
    total_project_report = results[3]['total_project_report']
    total_teacher = results[4]['total_teacher']
    total_researcher = results[5]['total_researcher']
    total_reviewer = results[6]['total_reviewer']
    total_student = results[7]['total_student']

    cursor.close()
    conn.close()
    
    return jsonify({
        'total_users': total_users,
        'total_projects': total_projects,
        'total_admin': total_admin,
        'total_researcher': total_researcher,
        'total_reviewer': total_reviewer,
        'total_teacher': total_teacher,
        'total_student': total_student,
        'total_project_report': total_project_report,
        'statuscode' : 200
    }) , 200


# Route to get self project dashboard
@projectuser_blueprint.route('/get_self_project_dashboard', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])
async def get_self_project_dashboard():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()
    
    async def execute_query(query, *params):
        cursor.execute(query, params)
        result = cursor.fetchone()
        return result

    async_queries = [
        execute_query("SELECT COUNT(*) AS completed_projects FROM Projects WHERE ProjectStatus = 'Completed' AND CreatorUserID = %s", (current_user_id,)),
        execute_query("SELECT COUNT(*) AS total_projects FROM ProjectListWithUserID WHERE UserID = %s", (current_user_id,)),
        execute_query("SELECT COUNT(*) AS pending_projects FROM Projects WHERE ProjectStatus = 'Pending' AND CreatorUserID = %s", (current_user_id,)),
        execute_query("SELECT COUNT(*) AS approved_projects FROM Projects WHERE ProjectStatus = 'Approved' AND CreatorUserID = %s", (current_user_id,)),
        execute_query("SELECT COUNT(*) AS rejected_projects FROM Projects WHERE ProjectStatus = 'Rejected' AND CreatorUserID = %s", (current_user_id,)),
        execute_query("SELECT COUNT(*) AS running_projects FROM Projects WHERE ProjectStatus = 'Running' AND CreatorUserID = %s", (current_user_id,)),
        execute_query("SELECT COUNT(*) AS final_report_submitted FROM Projects WHERE ProjectSoftCopyLocation IS NOT NULL AND ProjectSoftCopyLocation != '' AND CreatorUserID = %s", (current_user_id,))
    ]
    
    results = await asyncio.gather(*async_queries)

    completed_projects = results[0]['completed_projects']
    total_projects = results[1]['total_projects']
    pending_projects = results[2]['pending_projects']
    approved_projects = results[3]['approved_projects']
    rejected_projects = results[4]['rejected_projects']
    running_projects = results[5]['running_projects']
    final_report_submitted = results[6]['final_report_submitted']
    
    cursor.close()
    conn.close()
    
    return jsonify({
        'running_projects': running_projects,
        'rejected_projects': rejected_projects,
        'approved_projects': approved_projects,
        'pending_projects': pending_projects,
        'final_report_submitted': final_report_submitted,
        'completed_projects': completed_projects,
        'total_projects': total_projects,
        'statuscode' : 200
    }) , 200

# # Route to get all projectID and ProjectTitle for specific userID from FROM projectlistwithuserid
# @projectuser_blueprint.route('/get_all_projects_for_specific_user/<int:user_id>', methods=['GET'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])
# def get_all_projects_for_specific_user(user_id):
#     conn = get_db()
#     cursor = conn.cursor(dictionary=True)
#     cursor.execute("SELECT * FROM ProjectListWithUserID WHERE UserID = %s", (user_id))
#     projects_for_specific_user = cursor.fetchall()
#     cursor.close()
#     conn.close()
#     return jsonify({'projects_for_specific_user': projects_for_specific_user})



# # Route to get a specific project with userID
# @projectuser_blueprint.route('/get_specific_project_for_specific_user/<int:project_id>/<int:user_id>', methods=['GET'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])
# def get_specific_project_for_specific_user(project_id, user_id):
#     conn = get_db()
#     cursor = conn.cursor(dictionary=True)
#     cursor.execute("SELECT * FROM ProjectListWithUserID WHERE ProjectID = %s AND UserID = %s", (project_id, user_id))
#     project_with_user = cursor.fetchone()
#     cursor.close()
#     conn.close()
#     if project_with_user:
#         return jsonify({'specific_project_for_specific_user': project_with_user})
#     else:
#         return jsonify({'message': 'Project with user not found'}), 404



# # Route to delete a project with user ID
# @projectuser_blueprint.route('/delete_project_with_user/<int:project_id>/<int:user_id>', methods=['DELETE'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])
# def delete_project_with_user(project_id, user_id):
#     conn = get_db()
#     cursor = conn.cursor()
#     delete_query = "DELETE FROM ProjectListWithUserID WHERE ProjectID = %s AND UserID = %s"
#     cursor.execute(delete_query, (project_id, user_id))
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': f'Project with user, ProjectID: {project_id}, UserID: {user_id} deleted successfully'})


# # Route to delete all projects for a specific user
# @projectuser_blueprint.route('/delete_projects_for_specific_user/<int:user_id>', methods=['DELETE'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])
# def delete_projects_for_specific_user(user_id):
#     conn = get_db()
#     cursor = conn.cursor()
#     cursor.execute("DELETE FROM ProjectListWithUserID WHERE UserID = %s", (user_id,))
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': 'All projects for user with id ' + str(user_id) + ' deleted successfully'})


# ==========================================  Project_User Related Routes END  =============================
