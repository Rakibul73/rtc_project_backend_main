from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
from flask import  render_template, request, jsonify , Blueprint
from flask_jwt_extended import get_jwt_identity, jwt_required 
from auth_utils import role_required
from db import get_db # local module


user_blueprint = Blueprint('user', __name__)


# ==========================================  User Related Routes START =============================


# # Route to get total number of users
# @user_blueprint.route('/get_total_number_of_users', methods=['GET'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
# def get_total_number_of_users():
#     conn = get_db()
#     cursor = conn.cursor(dictionary=True)
#     cursor.execute("SELECT COUNT(*) AS total_users FROM Users")
#     total_users = cursor.fetchone()
#     cursor.close()
#     conn.close()
#     print(total_users['total_users'])
#     return jsonify({'total_users': total_users['total_users'] , "statuscode" : 200}) , 200


# Route to get all pending users
@user_blueprint.route('/get_all_pending_users', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1])  # Only admin and supervisor can access this route
def get_all_pending_users():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM TempUsers")
    TempUsers = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'TempUsers': TempUsers , "statuscode" : 200}) , 200


# Route to get a specific pending user
@user_blueprint.route('/get_specific_pending_user/<int:user_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def get_specific_pending_user(user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM TempUsers WHERE UserID = %s", (user_id,))
    TempUser = cursor.fetchone()
    cursor.close()
    conn.close()
    print(jsonify(TempUser))
    if TempUser:
        return jsonify({'TempUser': TempUser})
    else:
        return jsonify({'message': 'TempUser not found'}), 404


# Route to update a specific pending user
@user_blueprint.route('/update_pending_user/<int:user_id>', methods=['PUT'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def update_pending_user(user_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    print(data)
    update_query = "UPDATE TempUsers SET Username = %s , Email = %s , FirstName = %s , LastName = %s , Phone = %s , RoleID = %s , FacultyName = %s  WHERE UserID = %s"
    temp_user_data = (data['Username'] , data['Email'] , data['FirstName'] , data['LastName'] , data['Phone'] , data['RoleID'] , data['FacultyName'] , user_id)
    cursor.execute(update_query, temp_user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'TempUser updated successfully' , 'statuscode' : 200}), 200

# # Route to get all users
# @user_blueprint.route('/get_all_users', methods=['GET'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1, 2 , 3 , 4 , 5])  # Only admin and supervisor can access this route
# def get_all_users():
#     conn = get_db()
#     cursor = conn.cursor(dictionary=True)
#     cursor.execute("SELECT * FROM Users")
#     users = cursor.fetchall()
#     cursor.close()
#     conn.close()
#     return jsonify({'users': users , "statuscode" : 200}) , 200


# # Route to create a new user / register
# @user_blueprint.route('/create_users', methods=['POST'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1])  # Only admin can access this route
# def create_user():
#     data = request.get_json()
#     conn = get_db()
#     cursor = conn.cursor()
#     insert_query = "INSERT INTO Users (username, password, email , FirstName , LastName , Address , Phone , SalaryScale , HighestAcademicQualificationUniversity , HighestAcademicQualificationCountry , HighestAcademicQualificationYear , AreaOfExpertise , ExperienceInResearch , Teaching , RoleID , ProfilePicLocation , TotalNumberOfCompleteProjects , TotalNumberOfCompletePublications , OngoingProjects ) VALUES (%s, %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s , %s )"
#     user_data = (data['username'], data['password'], data['email'] , data["FirstName"] , data["LastName"] , data["Address"] , data["Phone"] , data["SalaryScale"] , data["HighestAcademicQualificationUniversity"] , data["HighestAcademicQualificationCountry"] , data["HighestAcademicQualificationYear"] , data["AreaOfExpertise"] , data["ExperienceInResearch"] , data["Teaching"] , data["RoleID"] , data["ProfilePicLocation"] , data["TotalNumberOfCompleteProjects"] , data["TotalNumberOfCompletePublications"] , data["OngoingProjects"])
#     cursor.execute(insert_query, user_data)
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': 'User created successfully' , 'statuscode' : 201}), 201


# Route to get a specific user
@user_blueprint.route('/get_specific_user/<int:user_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def get_specific_user(user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM Users WHERE Userid = %s", (user_id,))
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
    print(data)
    update_query = "UPDATE Users SET Username = %s , Email = %s , FirstName = %s , LastName = %s , FullNameBangla = %s , PositionEnglish = %s , PositionBangla = %s , PositionHeldSince = %s , Gender = %s , Dateofbirth = %s , Phone = %s , Nid = %s , NidLocation = %s , FacultyName = %s , DepartmentName = %s , InstituteName = %s , InstituteLocation = %s , InstituteEmail = %s , PresentAddress = %s , PermanentAddress = %s , ProfilePicLocation = %s , SignatureLocation = %s , SealLocation = %s , SalaryScale = %s , HighestAcademicQualification = %s , HighestAcademicQualificationUniversity = %s , HighestAcademicQualificationCountry = %s , HighestAcademicQualificationYear = %s , AreaOfExpertise = %s , ExperienceInResearch = %s , Teaching = %s , TotalNumberOfCompleteProjects = %s , TotalNumberOfCompletePublications = %s , OngoingProjects = %s , StudentID = %s , StudentRegNo = %s , FirstEnrollmentSemester = %s , UndergraduateCGPALevel = %s  WHERE Userid = %s"
    user_data = (data['Username'] , data['Email'] , data['FirstName'] , data['LastName'] , data['FullNameBangla'] , data['PositionEnglish'] , data['PositionBangla'] , data['PositionHeldSince'] , data['Gender'] , data['Dateofbirth'] , data['Phone'] , data['Nid'] , data['NidLocation'] , data['FacultyName'] , data['DepartmentName'] , data['InstituteName'] , data['InstituteLocation'] , data['InstituteEmail'] , data['PresentAddress'] , data['PermanentAddress'] , data['ProfilePicLocation'] , data['SignatureLocation'] , data['SealLocation'] , data['SalaryScale'] , data['HighestAcademicQualification'] , data['HighestAcademicQualificationUniversity'] , data['HighestAcademicQualificationCountry'] , data['HighestAcademicQualificationYear'] , data['AreaOfExpertise'] , data['ExperienceInResearch'] , data['Teaching'] , data['TotalNumberOfCompleteProjects'] , data['TotalNumberOfCompletePublications'] , data['OngoingProjects'] , data['StudentID'] , data['StudentRegNo'] , data['FirstEnrollmentSemester'] , data['UndergraduateCGPALevel'] , user_id)
    cursor.execute(update_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'User updated successfully' , 'statuscode' : 200}), 200

# Route to delete a Temp user
@user_blueprint.route('/delete_temp_user/<int:user_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def delete_temp_user(user_id):
    conn = get_db()
    cursor = conn.cursor()
    delete_query = "DELETE FROM TempUsers WHERE Userid = %s"
    cursor.execute(delete_query, (user_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'Pending User with id ' + str(user_id) + ' deleted successfully' , 'statuscode' : 200}), 200

# # Route to delete a user
# @user_blueprint.route('/delete_user/<int:user_id>', methods=['DELETE'])
# @jwt_required()  # Protect the route with JWT
# @role_required([1])
# def delete_user(user_id):
#     conn = get_db()
#     cursor = conn.cursor()
#     delete_query = "DELETE FROM Users WHERE Userid = %s"
#     cursor.execute(delete_query, (user_id,))
#     conn.commit()
#     cursor.close()
#     conn.close()
#     return jsonify({'message': 'User with id ' + str(user_id) + ' deleted successfully'})


# Route to get user role
@user_blueprint.route('/get_user_name_of_specific_user/<int:user_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def get_user_name_of_specific_user(user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT Username FROM Users WHERE Userid = %s", (user_id,))
    user_name = cursor.fetchone()
    cursor.close()
    conn.close()
    if user_name:
        return jsonify({"Username" : user_name['Username'] , "statuscode" : 200}), 200
    else:
        return jsonify({'message': 'User not found' , "statuscode" : 404}), 404


# Route to get all user names and IDs excluding users with the student role
@user_blueprint.route('/get_all_users_except_students', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2, 3, 4, 5])
def get_all_users_except_students():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT Userid, Username, FirstName , LastName , SignatureLocation , SealLocation , ProfilePicLocation FROM Users WHERE RoleID != 5")  # Assuming student role ID is 5
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
    cursor.execute("SELECT Userid, Username, FirstName , LastName , SignatureLocation , SealLocation FROM Users WHERE RoleID = 5")  # Assuming student role ID is 5
    users = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'users': users, "statuscode": 200}), 200



# Function to send email
def send_email(email , username , roleid):
    sender_email = "raqib.185.17@gmail.com"  # Replace with Admin email address
    password = "ozct kzkj dgje aufs"  # Replace with Admin email password
    # To get this gmail password, Go to the App passwords of your Google account,
    
    rolename = "Admin"
    if roleid == 1:
        rolename = "Admin"
    elif roleid == 2:
        rolename = "Researcher"
    elif roleid == 3:
        rolename = "Reviewer"
    elif roleid == 4:
        rolename = "Teacher"
    elif roleid == 5:
        rolename = "Student"
    
    # Render the HTML template with the reset URL
    email_body = render_template('email_template_approved_user_notification.html' , username = username , rolename=rolename)

    message = MIMEMultipart()
    message['From'] = sender_email
    message['To'] = email
    message['Subject'] = "Your RTC Project Account is Approved"

    # Attach HTML email body
    message.attach(MIMEText(email_body, 'html'))

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(sender_email, password)
    text = message.as_string()
    server.sendmail(sender_email, email, text)
    server.quit()


# Route to Approve a Temp user means to move it from TempUsers to Users
@user_blueprint.route('/approve_temp_user/<int:user_id>', methods=['DELETE'])
@jwt_required()  # Protect the route with JWT
@role_required([1])
def approve_temp_user(user_id):
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM TempUsers WHERE UserID = %s", (user_id,))
    TempUser = cursor.fetchone()
    print(TempUser[2])
    # save it in a Users table and delete it from TempUsers table
    if TempUser:
        insert_query = "INSERT INTO Users (Username, Password, Email , FirstName , LastName , Phone ,  RoleID , FacultyName) VALUES (%s, %s , %s , %s , %s , %s , %s , %s)"
        user_data = (TempUser[2], TempUser[3], TempUser[6] , TempUser[4], TempUser[5] , TempUser[7] , TempUser[1] , TempUser[8])
        cursor.execute(insert_query, user_data)
    
    
    delete_query = "DELETE FROM TempUsers WHERE Userid = %s"
    cursor.execute(delete_query, (user_id,))
    conn.commit()
    
    send_email(TempUser[6] , TempUser[2] , TempUser[1])
    
    cursor.close()
    conn.close()
    return jsonify({'message': 'Pending UserID ' + str(user_id) + ' approved successfully' , 'statuscode' : 200}), 200



# Route to get total number of all dashboard
@user_blueprint.route('/user_management_overview', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1])  # Only admin and supervisor can access this route
def user_management_overview():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    
    cursor.execute("SELECT COUNT(*) AS total_users FROM Users")
    total_users = cursor.fetchone()
    print(total_users['total_users'])
    
    cursor.execute("SELECT COUNT(*) AS total_pending_users FROM TempUsers")
    total_pending_users = cursor.fetchone()
    print(total_pending_users['total_pending_users'])
    
    cursor.execute("SELECT COUNT(*) AS total_admin FROM Users WHERE RoleID = 1")
    total_admin = cursor.fetchone()
    print(total_admin['total_admin'])
    
    cursor.execute("SELECT COUNT(*) AS total_teacher FROM Users WHERE RoleID = 4")
    total_teacher = cursor.fetchone()
    print(total_teacher['total_teacher'])
    
    cursor.execute("SELECT COUNT(*) AS total_researcher FROM Users WHERE RoleID = 2")
    total_researcher = cursor.fetchone()
    print(total_researcher['total_researcher'])
    
    cursor.execute("SELECT COUNT(*) AS total_reviewer FROM Users WHERE RoleID = 3")
    total_reviewer = cursor.fetchone()
    print(total_reviewer['total_reviewer'])
    
    cursor.execute("SELECT COUNT(*) AS total_student FROM Users WHERE RoleID = 5")
    total_student = cursor.fetchone()
    print(total_student['total_student'])
    
    
    
    cursor.close()
    conn.close()
    
    return jsonify({
        'total_users': total_users['total_users'],
        'total_pending_users': total_pending_users['total_pending_users'],
        'total_admin': total_admin['total_admin'],
        'total_researcher': total_researcher['total_researcher'],
        'total_reviewer': total_reviewer['total_reviewer'],
        'total_teacher': total_teacher['total_teacher'],
        'total_student': total_student['total_student'],
        'statuscode' : 200
    }) , 200



# Route to get a specific user
@user_blueprint.route('/get_specific_user_minimum/<int:user_id>', methods=['GET'])
@jwt_required()  # Protect the route with JWT
@role_required([1, 2 , 3 , 4 , 5])
def get_specific_user_minimum(user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT Username , FirstName , LastName , ProfilePicLocation FROM Users WHERE Userid = %s", (user_id,))
    user = cursor.fetchone()
    cursor.close()
    conn.close()
    print(jsonify(user))
    if user:
        return jsonify({'user': user , 'statuscode' : 200}), 200
    else:
        return jsonify({'message': 'User not found'}), 404

# ==========================================  User Related Routes END =============================
