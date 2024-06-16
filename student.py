from flask import request, jsonify, Blueprint
from flask_jwt_extended import jwt_required
from auth_utils import role_required
from db import get_db  # local module

student_blueprint = Blueprint('student', __name__)

# ==========================================  Student Related Routes START =============================


# Route to get all students
@student_blueprint.route('/get_all_students', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2, 3, 4, 5])
def get_all_students():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM studentuser")
    students = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'students': students})

# Route to create a new student


@student_blueprint.route('/create_student', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2, 3, 4, 5])
def create_student():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    insert_query = "INSERT INTO studentuser (StudentID , Name, RegNo, FirstEnrollmentSemester, UndergraduateCGPALevel) VALUES (%s, %s, %s, %s , %s)"
    student_data = (data['StudentID'], data['Name'], data['RegNo'],
                    data['FirstEnrollmentSemester'], data['UndergraduateCGPALevel'])
    cursor.execute(insert_query, student_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Student created successfully'}), 201

# Route to get a specific student


@student_blueprint.route('/get_specific_student/<int:student_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2, 3, 4, 5])
def get_specific_student(student_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(
        "SELECT * FROM studentuser WHERE StudentID = %s", (student_id,))
    student = cursor.fetchone()
    cursor.close()
    conn.close()
    if student:
        return jsonify({'student': student})
    else:
        return jsonify({'message': 'StudentID: ' + str(student_id) + ' not found'}), 404

# Route to update a student


@student_blueprint.route('/update_student/<int:student_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2, 3, 4, 5])
def update_student(student_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    update_query = "UPDATE studentuser SET Name = %s, RegNo = %s, FirstEnrollmentSemester = %s, UndergraduateCGPALevel = %s WHERE StudentID = %s"
    student_data = (data['Name'], data['RegNo'], data['FirstEnrollmentSemester'],
                    data['UndergraduateCGPALevel'], student_id)
    cursor.execute(update_query, student_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Student information with StudentID: ' + str(student_id) + ' updated successfully'})


# Route to delete a student
@student_blueprint.route('/delete_student/<int:student_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2, 3, 4, 5])
def delete_student(student_id):
    conn = get_db()
    cursor = conn.cursor()
    delete_query = "DELETE FROM studentuser WHERE StudentID = %s"
    cursor.execute(delete_query, (student_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'StudentID ' + str(student_id) + ' deleted successfully'})


# ==========================================  Student Related Routes END  =============================
