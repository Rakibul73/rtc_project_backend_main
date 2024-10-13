from flask import Blueprint, jsonify, request
from flask_jwt_extended import get_jwt_identity, jwt_required
from auth_utils import origin_verifier, role_required
from db import get_db

notification_blueprint = Blueprint('notification', __name__)

# Route to request project deletion to admin


@notification_blueprint.route('/request_project_deletion_to_admin/<int:project_id>', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([2, 3, 4, 5])  # Only teachers can request project deletion
def request_project_deletion_to_admin(project_id):
    conn = get_db()
    cursor = conn.cursor()

    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()

    # Check if the project exists and is current user is the creator
    cursor.execute("SELECT * FROM Projects WHERE ProjectID = %s AND CreatorUserID = %s",
                    (project_id, current_user_id))
    project = cursor.fetchone()
    if project is None:
        cursor.close()
        conn.close()
        return jsonify({'error': 'Project not found', 'statuscode': 404}), 404

    # Parse the reason for deletion from the request body
    data = request.get_json()
    reason = data.get('reasonForDelete', '')
    print(reason)

    # Create a notification for admin by putting null in ReceiverUserID
    try:
        notification_msg = f"ProjectDeletionRequest: Teacher ID: {current_user_id} requests deletion of Project ID: {project_id} for reason: {reason}"
        cursor.execute("INSERT INTO Notification (SenderUserID, Message , IsRead) VALUES (%s, %s, %s)",
                        (current_user_id, notification_msg, False))
        conn.commit()
    except Exception as e:
        cursor.close()
        conn.close()
        return jsonify({'error': str(e), 'statuscode': 500}), 500

    cursor.close()
    conn.close()
    return jsonify({'message': 'Project deletion request sent successfully', 'statuscode': 200}), 200


def extract_ids_from_notification(notification_message):
    # Extract sender ID and project ID from the notification message
    parts = notification_message.split()
    # Assuming the format is "ProjectDeletionRequest: Teacher ID: {sender_id} requests deletion of Project ID: {project_id} for reason: {reason}"
    sender_id = parts[3]
    project_id = parts[9]
    return int(sender_id), int(project_id)

# Route for admin to delete project requested for deletion


@notification_blueprint.route('/delete_project_request/<int:notification_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1])  # Only admin can delete project requests
def delete_project_request(notification_id):
    conn = get_db()
    cursor = conn.cursor()

    # Get the current user's ID from JWT (admin)
    # admin_id = get_jwt_identity()

    # Check if the notification exists
    cursor.execute("SELECT Message FROM Notification WHERE NotificationID = %s",
                   (notification_id,))
    notificationMessage = cursor.fetchone()[0]
    cursor.execute("SELECT IsDeleted FROM Notification WHERE NotificationID = %s",
                   (notification_id,))
    isDeleted = cursor.fetchone()[0]
    if notificationMessage is None:
        cursor.close()
        conn.close()
        return jsonify({'error': 'Notification not found', 'statuscode': 404}), 404
    if isDeleted == 1:
        cursor.close()
        conn.close()
        return jsonify({'message': 'Project already deleted', 'statuscode': 200}), 200
    print(notificationMessage)
    # Extract project and sender IDs from the notification message
    sender_id, project_id = extract_ids_from_notification(notificationMessage)
    print(sender_id, project_id)

    # Check if the project exists and if the sender is the creator of the project
    cursor.execute(
        "SELECT ProjectID FROM Projects WHERE ProjectID = %s AND CreatorUserID = %s", (project_id, sender_id))
    project = cursor.fetchone()
    if project is None:
        cursor.close()
        conn.close()
        return jsonify({'error': 'Project not found or not created by the sender', 'statuscode': 404}), 404

    # Delete the project
    try:
        # Remove from ActivityPlan table based on ProjectID
        # delete_activity_query = "DELETE FROM ActivityPlan WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM ActivityPlanHistory WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM ActivityPlanOriginal WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # # Remove from BudgetPlan table based on ProjectID
        # delete_activity_query = "DELETE FROM BudgetPlan WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM BudgetPlanHistory WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM BudgetPlanOriginal WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM ProjectAdvanceFund WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM ProjectFund WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM ProjectListWithReviewerID WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM ProjectListWithUserID WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM ProjectMonitoringFeedback WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM ProjectMonitoringReport WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        # delete_activity_query = "DELETE FROM Review WHERE ProjectID = %s"
        # cursor.execute(delete_activity_query, (project_id,))
        
        
        
        
        
        # # Remove from Projects table based on ProjectID
        # delete_query = "DELETE FROM Projects WHERE ProjectID = %s"
        # cursor.execute(delete_query, (project_id,))
        
        delete_statements = [
            "DELETE FROM ProjectMonitoringReportBudget WHERE ProjectMonitoringReportID IN (SELECT ProjectMonitoringReportID FROM ProjectMonitoringReport WHERE ProjectID = %s)",
            "DELETE FROM ProjectMonitoringReportActivity WHERE ProjectMonitoringReportID IN (SELECT ProjectMonitoringReportID FROM ProjectMonitoringReport WHERE ProjectID = %s)",
            "DELETE FROM ProjectReportListWithMonitoringCommitteeID WHERE ProjectMonitoringReportID IN (SELECT ProjectMonitoringReportID FROM ProjectMonitoringReport WHERE ProjectID = %s)",
            "DELETE FROM ProjectMonitoringFeedback WHERE ProjectID = %s",
            "DELETE FROM ProjectMonitoringReport WHERE ProjectID = %s",
            "DELETE FROM Review WHERE ProjectID = %s",
            "DELETE FROM projectlistwithreviewerID WHERE ProjectID = %s",
            "DELETE FROM ProjectListWithUserID WHERE ProjectID = %s",
            "DELETE FROM ProjectFund WHERE ProjectID = %s",
            "DELETE FROM ProjectAdvanceFund WHERE ProjectID = %s",
            "DELETE FROM BudgetPlanOriginal WHERE ProjectID = %s",
            "DELETE FROM BudgetPlanHistory WHERE ProjectID = %s",
            "DELETE FROM BudgetPlan WHERE ProjectID = %s",
            "DELETE FROM ActivityPlanOriginal WHERE ProjectID = %s",
            "DELETE FROM ActivityPlanHistory WHERE ProjectID = %s",
            "DELETE FROM ActivityPlan WHERE ProjectID = %s",
            "DELETE FROM Projects WHERE ProjectID = %s"
        ]

        # Execute each delete statement
        for statement in delete_statements:
            cursor.execute(statement, (project_id,))

        conn.commit()
    except Exception as e:
        cursor.close()
        conn.close()
        return jsonify({'error': str(e), 'statuscode': 500}), 500

    cursor.execute("UPDATE Notification SET IsDeleted = 1 WHERE NotificationID = %s", (notification_id,))
    conn.commit()
    
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project with id ' + str(project_id) + ' deleted successfully', 'statuscode': 200}), 200


#  Route for get self notification in  descending order based on timestamp
@notification_blueprint.route('/get_self_notification', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
# Only admin and supervisor can access this route
@role_required([1, 2, 3, 4, 5])
def get_self_notification():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    # get curent user id
    current_user_id = get_jwt_identity()
    cursor.execute(
        "SELECT * FROM Notification WHERE ReceiverUserID = %s ORDER BY Timestamp DESC", (current_user_id,))
    MyNotifications = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'MyNotifications': MyNotifications, "statuscode": 200}), 200


@notification_blueprint.route('/mark_as_unread/<int:notification_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])  # Only teachers can request project deletion
def mark_as_unread(notification_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        "UPDATE Notification SET IsRead = 0 WHERE NotificationID = %s", (notification_id,))

    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Notification marked as unread successfully', 'statuscode': 200}), 200


@notification_blueprint.route('/mark_as_read/<int:notification_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])  # Only teachers can request project deletion
def mark_as_read(notification_id):
    conn = get_db()
    cursor = conn.cursor()

    cursor.execute(
        "UPDATE Notification SET IsRead = 1 WHERE NotificationID = %s", (notification_id,))

    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Notification marked as read successfully', 'statuscode': 200}), 200


@notification_blueprint.route('/get_all_notification', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1])  # Only admin and supervisor can access this route
def get_all_notification():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Notification ORDER BY Timestamp DESC")
    AllNotifications = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'AllNotifications': AllNotifications, "statuscode": 200}), 200


@notification_blueprint.route('/mark_all_as_read', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4, 5])
def mark_all_as_read():
    conn = get_db()
    cursor = conn.cursor()
    # get curent user id
    current_user_id = get_jwt_identity()
    cursor.execute(
        "UPDATE Notification SET IsRead = 1 WHERE ReceiverUserID = %s", (current_user_id,))

    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Notification marked as read successfully', 'statuscode': 200}), 200


# Route to get a specific notification
@notification_blueprint.route('/get_specific_notification/<int:notification_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@origin_verifier
@role_required([1, 2, 3, 4])
def get_specific_notification(notification_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        "SELECT * FROM Notification WHERE NotificationID = %s", (notification_id,))
    notification_data = cursor.fetchone()
    cursor.close()
    conn.close()
    if notification_data:
        return jsonify({'Notification': notification_data, 'statuscode': 200}), 200
    else:
        return jsonify({'message': 'Notification not found', 'statuscode': 404}), 404
