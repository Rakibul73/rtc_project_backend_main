from flask import request, jsonify , Blueprint
from flask_jwt_extended import jwt_required
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
    insert_query = "INSERT INTO Review (ProjectID, ReviewerUserID) VALUES (%s, %s)"
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
    cursor.execute("SELECT ReviewerUserID FROM Review WHERE ProjectID = %s", (project_id,))
    revieweruserid = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'revieweruserid': revieweruserid , 'statuscode' : 200}), 200



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
