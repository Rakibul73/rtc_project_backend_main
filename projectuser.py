from flask import request, jsonify , Blueprint
from flask_jwt_extended import jwt_required
from auth_utils import role_required
from db import get_db  #  local module 


projectuser_blueprint = Blueprint('projectuser', __name__)

# ==========================================  Project_User Related Routes START =============================

# Route to get total number of users
@projectuser_blueprint.route('/get_total_number_of_all_dashboard', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def get_total_number_of_all_dashboard():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT COUNT(*) AS total_users FROM users")
    total_users = cursor.fetchone()
    print(total_users['total_users'])
    
    cursor.execute("SELECT COUNT(*) AS total_projects FROM projects")
    total_projects = cursor.fetchone()
    print(total_projects['total_projects'])
    
    cursor.execute("SELECT COUNT(*) AS total_admin FROM users WHERE RoleID = 1")
    total_admin = cursor.fetchone()
    print(total_admin['total_admin'])
    
    cursor.execute("SELECT COUNT(*) AS total_researcher FROM users WHERE RoleID = 2")
    total_researcher = cursor.fetchone()
    print(total_researcher['total_researcher'])
    
    cursor.execute("SELECT COUNT(*) AS total_reviewer FROM users WHERE RoleID = 3")
    total_reviewer = cursor.fetchone()
    print(total_reviewer['total_reviewer'])
    
    cursor.execute("SELECT COUNT(*) AS total_teacher FROM users WHERE RoleID = 4")
    total_teacher = cursor.fetchone()
    print(total_teacher['total_teacher'])
    
    cursor.execute("SELECT COUNT(*) AS total_student FROM studentuser")
    total_student = cursor.fetchone()
    print(total_student['total_student'])
    
    cursor.execute("SELECT COUNT(*) AS total_project_report FROM projects WHERE ProjectSoftCopyLocation IS NOT NULL")
    total_project_report = cursor.fetchone()
    print(total_project_report['total_project_report'])
    
    cursor.close()
    conn.close()
    
    return jsonify({
        'total_users': total_users['total_users'],
        'total_projects': total_projects['total_projects'],
        'total_admin': total_admin['total_admin'],
        'total_researcher': total_researcher['total_researcher'],
        'total_reviewer': total_reviewer['total_reviewer'],
        'total_teacher': total_teacher['total_teacher'],
        'total_student': total_student['total_student'],
        'total_project_report': total_project_report['total_project_report'],
        'statuscode' : 200
    }) , 200

# Route to get all projects for specific userID
@projectuser_blueprint.route('/get_all_projects_for_specific_user/<int:user_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
def get_all_projects_for_specific_user(user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM projectlistwithuserid WHERE UserID = %s", (user_id))
    projects_for_specific_user = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'projects_for_specific_user': projects_for_specific_user})


# Route to get a specific project with userID
@projectuser_blueprint.route('/get_specific_project_for_specific_user/<int:project_id>/<int:user_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
def get_specific_project_for_specific_user(project_id, user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM projectlistwithuserid WHERE ProjectID = %s AND UserID = %s", (project_id, user_id))
    project_with_user = cursor.fetchone()
    cursor.close()
    conn.close()
    if project_with_user:
        return jsonify({'specific_project_for_specific_user': project_with_user})
    else:
        return jsonify({'message': 'Project with user not found'}), 404



# Route to delete a project with user ID
@projectuser_blueprint.route('/delete_project_with_user/<int:project_id>/<int:user_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
def delete_project_with_user(project_id, user_id):
    conn = get_db()
    cursor = conn.cursor()
    delete_query = "DELETE FROM projectlistwithuserid WHERE ProjectID = %s AND UserID = %s"
    cursor.execute(delete_query, (project_id, user_id))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': f'Project with user, ProjectID: {project_id}, UserID: {user_id} deleted successfully'})


# Route to delete all projects for a specific user
@projectuser_blueprint.route('/delete_projects_for_specific_user/<int:user_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
def delete_projects_for_specific_user(user_id):
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM projectlistwithuserid WHERE UserID = %s", (user_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'All projects for user with id ' + str(user_id) + ' deleted successfully'})


# ==========================================  Project_User Related Routes END  =============================
