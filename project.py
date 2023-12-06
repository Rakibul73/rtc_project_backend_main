from flask import request, jsonify
from db import get_db # local module


# Route to get all projects
def get_all_projects():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM projects")
    project_list = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return jsonify({'projects': project_list})


# Route to create a new project
def create_project():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    
    # Validate input data
    if 'ProjectTitle' not in data or 'CreatorUserID' not in data:
        return jsonify({'error': 'Incomplete data. Title, CreatorUserID are required.'}), 400

    insert_query = "INSERT INTO projects (CodeByRTC, DateRecieved, ProjectTitle, NatureOfResearchProposal , CreatorUserID) VALUES (%s, %s , %s , %s , %s)"
    user_data = ( data['CodeByRTC'], data['DateRecieved'], data['ProjectTitle'], data['NatureOfResearchProposal'] , data['CreatorUserID'])
    cursor.execute(insert_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'User created successfully'}), 201


# Route to get a specific project
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
def update_project(project_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    update_query = "UPDATE projects SET CodeByRTC = %s , DateRecieved = %s , ProjectTitle = %s , NatureOfResearchProposal = %s , CreatorUserID = %s WHERE ProjectID = %s"
    user_data = ( data['CodeByRTC'], data['DateRecieved'], data['ProjectTitle'], data['NatureOfResearchProposal'] , data['CreatorUserID'] , project_id)
    cursor.execute(update_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project updated successfully'})


# Route to delete a project
def delete_project(project_id):
    conn = get_db()
    cursor = conn.cursor()
    delete_query = "DELETE FROM projects WHERE ProjectID = %s"
    cursor.execute(delete_query, (project_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project with id ' + str(project_id) + ' deleted successfully'})

