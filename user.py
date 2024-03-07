from flask import  request, jsonify , Blueprint
from flask_jwt_extended import jwt_required 
from auth_utils import role_required
from db import get_db # local module


user_blueprint = Blueprint('user', __name__)


# ==========================================  User Related Routes START =============================


# Route to get total number of users
@user_blueprint.route('/get_total_number_of_users', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def get_total_number_of_users():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT COUNT(*) AS total_users FROM users")
    total_users = cursor.fetchone()
    cursor.close()
    conn.close()
    print(total_users['total_users'])
    return jsonify({'total_users': total_users['total_users'] , "statuscode" : 200}) , 200


# Route to get all users
@user_blueprint.route('/get_all_users', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
def get_all_users():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'users': users , "statuscode" : 200}) , 200

# Route to create a new user / register
@user_blueprint.route('/create_users', methods=['POST'])
@jwt_required()  # Protect the route with JWT
@role_required([1])  # Only admin can access this route
def create_user():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    insert_query = "INSERT INTO users (username, password, email , FirstName , LastName , Address , Phone , SalaryScale , HighestAcademicQualificationUniversity , HighestAcademicQualificationCountry , HighestAcademicQualificationYear , AreaOfExpertise , ExperienceInResearch , Teaching , RoleID , ProfilePicLocation , TotalNumberOfCompleteProjects , TotalNumberOfCompletePublications , OngoingProjects ) VALUES (%s, %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s )"
    user_data = (data['username'], data['password'], data['email'] , data["FirstName"] , data["LastName"] , data["Address"] , data["Phone"] , data["SalaryScale"] , data["HighestAcademicQualificationUniversity"] , data["HighestAcademicQualificationCountry"] , data["HighestAcademicQualificationYear"] , data["AreaOfExpertise"] , data["ExperienceInResearch"] , data["Teaching"] , data["RoleID"] , data["ProfilePicLocation"] , data["TotalNumberOfCompleteProjects"] , data["TotalNumberOfCompletePublications"] , data["OngoingProjects"])
    cursor.execute(insert_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'User created successfully' , 'statuscode' : 201}), 201

# Route to get a specific user
@user_blueprint.route('/get_specific_user/<int:user_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def get_specific_user(user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users WHERE Userid = %s", (user_id,))
    user = cursor.fetchone()
    cursor.close()
    conn.close()
    print(jsonify(user))
    if user:
        return jsonify({'user': user})
    else:
        return jsonify({'message': 'User not found'}), 404

# Route to update a user
@user_blueprint.route('/update_user/<int:user_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def update_user(user_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    update_query = "UPDATE users SET username = %s, FirstName = %s, LastName = %s, Address = %s, Phone = %s, SalaryScale = %s, HighestAcademicQualification = %s, HighestAcademicQualificationUniversity = %s, HighestAcademicQualificationCountry = %s, HighestAcademicQualificationYear = %s, AreaOfExpertise = %s, ExperienceInResearch = %s, Teaching = %s, RoleID = %s, ProfilePicLocation = %s, TotalNumberOfCompleteProjects = %s, TotalNumberOfCompletePublications = %s, OngoingProjects = %s  WHERE Userid = %s"
    user_data = (data['username'], data["FirstName"] , data["LastName"] , data["Address"] , data["Phone"] , data["SalaryScale"] , data["HighestAcademicQualification"] , data["HighestAcademicQualificationUniversity"] , data["HighestAcademicQualificationCountry"] , data["HighestAcademicQualificationYear"] , data["AreaOfExpertise"] , data["ExperienceInResearch"] , data["Teaching"] , data["RoleID"] , data["ProfilePicLocation"] , data["TotalNumberOfCompleteProjects"] , data["TotalNumberOfCompletePublications"] , data["OngoingProjects"] , user_id)
    cursor.execute(update_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'User updated successfully' , 'statuscode' : 200}), 200

# Route to delete a user
@user_blueprint.route('/delete_user/<int:user_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def delete_user(user_id):
    conn = get_db()
    cursor = conn.cursor()
    delete_query = "DELETE FROM users WHERE Userid = %s"
    cursor.execute(delete_query, (user_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'User with id ' + str(user_id) + ' deleted successfully'})


# Route to get user role
@user_blueprint.route('/get_user_role_of_specific_user/<int:user_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 4])
def get_user_role_of_specific_user(user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT RoleID , Username, FirstName , LastName  FROM users WHERE Userid = %s", (user_id,))
    user_role = cursor.fetchone()
    # from RoleID fetch RoleName
    cursor.execute("SELECT RoleName FROM role WHERE RoleID = %s", (user_role['RoleID'],))
    role_name = cursor.fetchone()
    cursor.close()
    conn.close()
    if user_role:
        return jsonify({"RoleID": user_role['RoleID'] , "Role_name" : role_name['RoleName'] , "Username" : user_role['Username'] , "FirstName" : user_role['FirstName'] , "LastName" : user_role['LastName']})
    else:
        return jsonify({'message': 'User not found'}), 404


# Route to get all user names and IDs excluding users with the student role
@user_blueprint.route('/get_all_users_except_students', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2, 3, 4, 5])
def get_all_users_except_students():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT Userid, Username, FirstName , LastName FROM users WHERE RoleID != 5")  # Assuming student role ID is 5
    users = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'users': users, "statuscode": 200}), 200


# Route to get all user names and IDs only with the student role
@user_blueprint.route('/get_only_student_users', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2, 3, 4, 5])
def get_only_student_users():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT Userid, Username, FirstName , LastName FROM users WHERE RoleID = 5")  # Assuming student role ID is 5
    users = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'users': users, "statuscode": 200}), 200


# ==========================================  User Related Routes END =============================
