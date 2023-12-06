from flask import request, jsonify
from db import get_db  #  local module 


# Route to get all projects for specific userID
def get_all_projects_for_specific_user(user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM ProjectListWithUserID WHERE UserID = %s", (user_id))
    projects_for_specific_user = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'projects_for_specific_user': projects_for_specific_user})


# Route to get a specific project with userID
def get_specific_project_for_specific_user(project_id, user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM ProjectListWithUserID WHERE ProjectID = %s AND UserID = %s", (project_id, user_id))
    project_with_user = cursor.fetchone()
    cursor.close()
    conn.close()
    if project_with_user:
        return jsonify({'specific_project_for_specific_user': project_with_user})
    else:
        return jsonify({'message': 'Project with user not found'}), 404



# Route to delete a project with user ID
def delete_project_with_user(project_id, user_id):
    conn = get_db()
    cursor = conn.cursor()
    delete_query = "DELETE FROM ProjectListWithUserID WHERE ProjectID = %s AND UserID = %s"
    cursor.execute(delete_query, (project_id, user_id))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': f'Project with user, ProjectID: {project_id}, UserID: {user_id} deleted successfully'})


# Route to delete all projects for a specific user
def delete_projects_for_specific_user(user_id):
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("DELETE FROM ProjectListWithUserID WHERE UserID = %s", (user_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'All projects for user with id ' + str(user_id) + ' deleted successfully'})


