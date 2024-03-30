from flask import request, jsonify , Blueprint
from flask_jwt_extended import get_jwt_identity, jwt_required
from auth_utils import role_required
from db import get_db  # Assuming get_db is a local module providing database connection

review_blueprint = Blueprint('review', __name__)


# ==========================================  Review Related Routes START =============================

# Route to create a new review for a project
@review_blueprint.route('/set_reviewer_for_specific_project', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def set_reviewer_for_specific_project():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    insert_query = "INSERT INTO ProjectListWithReviewerID (ProjectID, ReviewerUserID) VALUES (%s, %s)"
    review_data = (data['ProjectID'], data['ReviewerUserID'])
    cursor.execute(insert_query, review_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Reviewer Set successfully' , 'statuscode' : 201}), 201


# Route to get all revieweruserid for a specific project
@review_blueprint.route('/get_revieweruserid_for_specific_project/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def get_revieweruserid_for_specific_project(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT ReviewerUserID FROM ProjectListWithReviewerID WHERE ProjectID = %s", (project_id,))
    revieweruserid = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'revieweruserid': revieweruserid , 'statuscode' : 200}), 200


# Route to get total number of review dashboard
@review_blueprint.route('/review_dashboard', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def review_dashboard():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()
    
    cursor.execute("SELECT COUNT(*) AS total_projects_to_review FROM ProjectListWithReviewerID WHERE ReviewerUserID = %s", (current_user_id,))
    total_projects_to_review = cursor.fetchone()
    print(total_projects_to_review['total_projects_to_review'])
    
    cursor.execute("SELECT COUNT(*) AS completed_reviews FROM Review WHERE ReviewerUserID = %s AND Comments IS NOT NULL" , (current_user_id,))
    completed_reviews = cursor.fetchone()
    print(completed_reviews['completed_reviews'])
    
    pending_reviews = {'pending_reviews': total_projects_to_review['total_projects_to_review'] - completed_reviews['completed_reviews']}
    
    # Get the project IDs associated with the current user from projectlistwithuserid table
    cursor.execute("SELECT ProjectID FROM projectlistwithuserid WHERE UserID = %s", (current_user_id,))
    user_projects = cursor.fetchall()
    if len(user_projects) == 0:
        review_queue = {'review_queue': 0}
        review_done = {'review_done': 0}
    else:
        print("Count how many of the user's projects are added in the review table")
        # Count how many of the user's projects are added in the review table
        projects_in_review = [project['ProjectID'] for project in user_projects]
        print(projects_in_review)
        cursor.execute("SELECT COUNT(DISTINCT ProjectID) AS review_queue FROM ProjectListWithReviewerID WHERE ProjectID IN ({})".format(
            ', '.join(['%s']*len(projects_in_review))), projects_in_review)
        review_queue = cursor.fetchone()
        
        cursor.execute("SELECT COUNT(DISTINCT ProjectID) AS review_done FROM Review WHERE ProjectID IN ({}) AND Comments IS NOT NULL".format(
            ', '.join(['%s']*len(projects_in_review))), projects_in_review)
        review_done = cursor.fetchone()
    
    print(review_queue['review_queue'])
    print(review_done['review_done'])
    
    cursor.close()
    conn.close()
    
    return jsonify({
        'total_projects_to_review': total_projects_to_review['total_projects_to_review'],
        'completed_reviews': completed_reviews['completed_reviews'],
        'review_queue': review_queue['review_queue'],
        'pending_reviews': pending_reviews['pending_reviews'],
        'review_done': review_done['review_done'],
        'statuscode' : 200
    }) , 200



# Route to get all projects have to review
@review_blueprint.route('/get_all_projects_have_to_review', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def get_all_projects_have_to_review():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    # Get the current user's ID from JWT
    current_user_id = get_jwt_identity()
    cursor.execute("SELECT * FROM ProjectListWithReviewerID WHERE ReviewerUserID = %s", (current_user_id,))
    ProjectHaveToReviewList = cursor.fetchall()
    # retrieve all projects that have to be reviewed with ProjectHaveToReviewList 
    projects_in_review = [project['ProjectID'] for project in ProjectHaveToReviewList]
    cursor.execute("SELECT * FROM Projects WHERE ProjectID IN ({})".format(
        ', '.join(['%s']*len(projects_in_review))), projects_in_review)
    
    ProjectHaveToReviewList = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'ProjectHaveToReviewList': ProjectHaveToReviewList , "statuscode" : 200}) , 200



# Route to get wether a project reviewed or not
@review_blueprint.route('/check_a_project_reviewed_or_not/<int:project_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def check_a_project_reviewed_or_not(project_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM Review WHERE ProjectID = %s", (project_id,))
    ProjectReviewCheck = cursor.fetchall()
    cursor.close()
    conn.close()
    if ProjectReviewCheck:
        return jsonify({'ProjectReviewCheck': "Yes" , "statuscode" : 200}) , 200
    else:
        return jsonify({'ProjectReviewCheck': "No" , "statuscode" : 200}) , 200
    


# # Route to get all reviews for a specific project
# @review_blueprint.route('/get_reviews_for_specific_project/<int:project_id>', methods=['GET'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])
# def get_reviews_for_specific_project(project_id):
#     conn = get_db()
#     cursor = conn.cursor(dictionary=True)
#     cursor.execute("SELECT * FROM Review WHERE ProjectID = %s", (project_id,))
#     reviews = cursor.fetchall()
#     cursor.close()
#     conn.close()
#     return jsonify({'reviews': reviews})

# # Route to create a new review for a project
# @review_blueprint.route('/create_reviews_specific_project', methods=['POST'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])
# def create_reviews_specific_project():
#     data = request.get_json()
#     conn = get_db()
#     cursor = conn.cursor()
#     insert_query = "INSERT INTO Review (ProjectID, ReviewerUserID, Comments, Rating, Points) VALUES (%s, %s, %s, %s, %s)"
#     review_data = (data['ProjectID'], data['ReviewerUserID'], data['Comments'], data['Rating'], data['Points'])
#     cursor.execute(insert_query, review_data)
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': 'Review created successfully'}), 201

# # Route to update a specific project review
# @review_blueprint.route('/update_specific_project_review/<int:review_id>', methods=['PUT'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])
# def update_specific_project_review(review_id):
#     data = request.get_json()
#     conn = get_db()
#     cursor = conn.cursor()
#     update_query = "UPDATE Review SET Comments = %s, Rating = %s, Points = %s WHERE ReviewID = %s"
#     review_data = (data['comments'], data['rating'], data['points'], review_id)
#     cursor.execute(update_query, review_data)
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': 'Review updated successfully'})

# # Route to delete a specific project review
# @review_blueprint.route('/delete_specific_project_review/<int:review_id>', methods=['DELETE'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])
# def delete_specific_project_review(review_id):
#     conn = get_db()
#     cursor = conn.cursor()
#     cursor.execute("DELETE FROM Review WHERE ReviewID = %s", (review_id,))
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': 'Review with id ' + str(review_id) + ' deleted successfully'})


# # Route to get all reviews for a specific reviewer user
# @review_blueprint.route('/get_all_reviews_for_specific_reviewer/<int:reviewer_user_id>', methods=['GET'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])
# def get_all_reviews_for_specific_reviewer(reviewer_user_id):
#     conn = get_db()
#     cursor = conn.cursor(dictionary=True)
#     cursor.execute("SELECT * FROM Review WHERE ReviewerUserID = %s", (reviewer_user_id,))
#     reviews = cursor.fetchall()
#     cursor.close()
#     conn.close()
#     return jsonify({'reviews': reviews})


# # Route to delete all reviews for a specific project
# @review_blueprint.route('/delete_all_reviews_for_specific_project/<int:project_id>', methods=['DELETE'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])
# def delete_all_reviews_for_specific_project(project_id):
#     conn = get_db()
#     cursor = conn.cursor()
#     cursor.execute("DELETE FROM Review WHERE ProjectID = %s", (project_id,))
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': f'All Reviews for ProjectID {project_id} deleted successfully'})

# ==========================================  Review Related Routes END  =============================
