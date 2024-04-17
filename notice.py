from flask import Blueprint, jsonify, request, send_from_directory
from flask_jwt_extended import jwt_required
from auth_utils import role_required
from db import get_db

notice_blueprint = Blueprint('notice', __name__)


# Route to get all notices
@notice_blueprint.route('/notices', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1 , 2 , 3 , 4 , 5])
def get_all_projects():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT * FROM Notice ORDER BY DatePublished DESC")
    notices_list = cursor.fetchall()
    
    cursor.close()
    conn.close()
    
    return jsonify({'notices': notices_list  , "statuscode" : 200}) , 200



# Route to create a new project
@notice_blueprint.route('/create_notice', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def create_notice():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    
    insert_query = "INSERT INTO Notice (Subject, NoticeFileLocation , DatePublished) VALUES (%s, %s , %s)"
    user_data = ( data['Subject'], data['NoticeFileLocation'] , data['DatePublished'])
    cursor.execute(insert_query, user_data)
    conn.commit()
    notice_id = cursor.lastrowid
    cursor.close()
    conn.close()
    return jsonify({'message': 'Notice created successfully' , 'notice_id' : notice_id , 'statuscode' : 201}), 201



# Route to get all reviews for a specific project
@notice_blueprint.route('/get_notice/<int:notice_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def get_notice(notice_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Notice WHERE NoticeID = %s", (notice_id,))
    notice = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'notice': notice , 'statuscode' : 200}), 200


# Route to update basic info of a project of self 
@notice_blueprint.route('/update_notice/<int:notice_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def update_notice(notice_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    
    notice_query = "UPDATE Notice SET NoticeFileLocation = %s , Subject = %s , DatePublished = %s WHERE NoticeID = %s"
    notice_data = (data['NoticeFileLocation'] , data['Subject'] , data['DatePublished'] , notice_id)
    cursor.execute(notice_query, notice_data)
    
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Project updated successfully', 'statuscode' : 200}), 200



# Route to delete a notice
@notice_blueprint.route('/notice/<int:notice_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def delete_project(notice_id):
    conn = get_db()
    cursor = conn.cursor()
    delete_activity_query = "DELETE FROM Notice WHERE NoticeID = %s"
    cursor.execute(delete_activity_query, (notice_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Notice with id ' + str(notice_id) + ' deleted successfully' , 'statuscode' : 200}), 200



