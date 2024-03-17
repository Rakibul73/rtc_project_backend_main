from flask import Blueprint, jsonify
from flask_jwt_extended import get_jwt_identity, jwt_required
from auth_utils import role_required
from db import get_db

notification_blueprint = Blueprint('notification', __name__)

@notification_blueprint.route('/request_project_deletion_to_admin/<int:project_id>', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([2 , 3 , 4 , 5])  # Only teachers can request project deletion
def request_project_deletion_to_admin(project_id):
    conn = get_db()
    cursor = conn.cursor()
    
    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()
    
    # Check if the project exists and is current user is the creator
    cursor.execute("SELECT * FROM Projects WHERE ProjectID = %s AND CreatorUserID = %s", (project_id, current_user_id))
    project = cursor.fetchone()
    if project is None:
        cursor.close()
        conn.close()
        return jsonify({'error': 'Project not found' , 'statuscode' : 404}), 404
    
    # Create a notification for admin
    try:
        notification_msg = f"Teacher ID: {current_user_id} requests deletion of Project ID: {project_id}"
        cursor.execute("INSERT INTO Notification (SenderUserID, ReceiverUserID, Message) VALUES (%s, %s, %s)", (current_user_id, 1, notification_msg))
        conn.commit()
    except Exception as e:
        cursor.close()
        conn.close()
        return jsonify({'error': str(e) , 'statuscode' : 500}), 500
    
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project deletion request sent successfully' , 'statuscode' : 200}), 200

def extract_ids_from_notification(notification_message):
    # Extract sender ID and project ID from the notification message
    parts = notification_message.split()
    sender_id = parts[2]  # Assuming the format is "Teacher ID: {sender_id} requests deletion of Project ID: {project_id}"
    project_id = parts[8]
    return int(sender_id), int(project_id)

# Route for admin to delete project requested for deletion
@notification_blueprint.route('/delete_project_request/<int:notification_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
@role_required([1])  # Only admin can delete project requests
def delete_project_request(notification_id):
    conn = get_db()
    cursor = conn.cursor()
    
    # Get the current user's ID from JWT (admin)
    admin_id = get_jwt_identity()
    
    # Check if the notification exists and if the admin has access to it
    cursor.execute("SELECT * FROM Notification WHERE NotificationID = %s AND ReceiverUserID = %s", (notification_id, admin_id))
    notification = cursor.fetchone()
    if notification is None:
        cursor.close()
        conn.close()
        return jsonify({'error': 'Notification not found or unauthorized access' , 'statuscode' : 404}), 404
    
    
    # Extract project and sender IDs from the notification message
    sender_id, project_id = extract_ids_from_notification(notification[3])
    print(sender_id, project_id)
    
    # Check if the project exists and if the sender is the creator of the project
    cursor.execute("SELECT * FROM Projects WHERE ProjectID = %s AND CreatorUserID = %s", (project_id, sender_id))
    project = cursor.fetchone()
    if project is None:
        cursor.close()
        conn.close()
        return jsonify({'error': 'Project not found or unauthorized deletion' , 'statuscode' : 404}), 404
    
    # Delete the project
    try:
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
        delete_query = "DELETE FROM projects WHERE ProjectID = %s"
        cursor.execute(delete_query, (project_id,))
        
        conn.commit()
    except Exception as e:
        cursor.close()
        conn.close()
        return jsonify({'error': str(e) , 'statuscode' : 500}), 500
    
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project with id ' + str(project_id) + ' deleted successfully' , 'statuscode' : 200}), 200

