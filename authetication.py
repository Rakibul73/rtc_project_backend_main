from flask import  render_template, request, jsonify , session , Blueprint
from db import get_db # local module
from werkzeug.security import generate_password_hash, check_password_hash
from flask_jwt_extended import create_access_token
import random
import string
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

auth_blueprint = Blueprint('auth', __name__)


# ========================================  Login & Register Related Routes START =============================

# Function to send email
def send_email(email, reset_otp):
    sender_email = "raqib.185.17@gmail.com"  # Replace with Admin email address
    password = "ozct kzkj dgje aufs"  # Replace with Admin email password
    # To get this gmail password, Go to the App passwords of your Google account,
    
    # Render the HTML template with the reset URL
    email_body = render_template('email_template_passreset.html', reset_otp=reset_otp)

    message = MIMEMultipart()
    message['From'] = sender_email
    message['To'] = email
    message['Subject'] = "RTC Project Password Reset Link"

    # Attach HTML email body
    message.attach(MIMEText(email_body, 'html'))

    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(sender_email, password)
    text = message.as_string()
    server.sendmail(sender_email, email, text)
    server.quit()

# Function to generate random string
def generate_token(length=10):
    letters = string.ascii_letters + string.digits
    return ''.join(random.choice(letters) for _ in range(length))

# Route to send password to email
@auth_blueprint.route('/send_password', methods=['POST'])
def send_password():
    data = request.get_json()
    email = data.get('email')
    
    # Check if the email exists in the database
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Users WHERE email = %s", (email,))
    user = cursor.fetchone()
    cursor.close()
    
    if not user:
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'Email not found' , 'statuscode' : 404}), 404

    cursor = conn.cursor()
    cursor.execute("SELECT PASSWORD FROM Users WHERE email = %s", (email,))
    PASSWORD = cursor.fetchone()
    cursor.close()
    conn.close()
    
    # send the email with the password
    try:
        sender_email = "tuimorsala01@gmail.com"  # Replace with your email address
        password = "szfl khwy snmp huic"  # Replace with your email password
        
        # Render the HTML template with the reset URL
        email_body = render_template('email_template_pass_forward.html', password=PASSWORD[0])

        message = MIMEMultipart()
        message['From'] = sender_email
        message['To'] = email
        message['Subject'] = "RTC Project Password Request"

        # Attach HTML email body
        message.attach(MIMEText(email_body, 'html'))

        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(sender_email, password)
        text = message.as_string()
        server.sendmail(sender_email, email, text)
        server.quit()
        return jsonify({'message': 'Password sent to email' , 'statuscode' : 200}), 200
    except:
        return jsonify({'message': 'Email not found' , 'statuscode' : 404}), 404



# Route to request password reset
@auth_blueprint.route('/reset_password_request', methods=['POST'])
def reset_password_request():
    data = request.get_json()
    email = data.get('email')

    # Check if the email exists in the database
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Users WHERE email = %s", (email,))
    user = cursor.fetchone()
    cursor.close()

    if not user:
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'Email not found' , 'statuscode' : 404}), 404

    # Generate a random token
    token = generate_token()

    # Store the token in the database
    cursor = conn.cursor()
    insert_query = "INSERT INTO PassReset (Email, ResetToken , Used) VALUES (%s, %s , %s)"
    # used == 1 means not used
    user_data = (email, token, 1)
    cursor.execute(insert_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()

    # Construct the reset URL
    reset_otp = f"{token}"

    # Send the email with the reset URL
    send_email(email, reset_otp)

    return jsonify({'message': 'Password reset email sent' , 'statuscode' : 200}), 200


# Route to reset password
@auth_blueprint.route('/reset_password/<token>', methods=['POST'])
def reset_password(token):
    data = request.get_json()
    new_password = data.get('new_password')

    # Retrieve the email associated with the token
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM PassReset WHERE ResetToken = %s", (token,))
    result = cursor.fetchone()
    
    if result is None:
        cursor.close()
        conn.close()
        return jsonify({'message': 'Invalid token' , 'statuscode' : 404}), 404
    
    print(result)
    email = result[0]
    used = result[2]

    if used == 0:
        cursor.close()
        conn.close()
        return jsonify({'message': 'Token already used' , 'statuscode' : 400}), 400

    # Hash the new password
    hashed_password = generate_password_hash(new_password, method='pbkdf2:sha256')
    # Update the user's password
    cursor = conn.cursor()
    update_query = "UPDATE Users SET PASSWORD = %s WHERE Email = %s"
    user_data = (hashed_password, email)
    cursor.execute(update_query, user_data)
    cursor.execute("UPDATE PassReset SET Used = 0 WHERE ResetToken = %s", (token,))
    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'message': 'Password reset successfully' , 'statuscode' : 200 , 'email' : email}), 200


# Route for user registration
@auth_blueprint.route('/register', methods=['POST'])
def register_user():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    username = data.get('username')
    email = data.get('email')
    cursor.execute("SELECT * FROM Users WHERE username = %s", (username,))
    isUserExist = cursor.fetchone()
    cursor.execute("SELECT * FROM Users WHERE email = %s", (email,))
    isEmailExist = cursor.fetchone()
    print("All clear")
    if isUserExist is None and isEmailExist is None:
        # Hash the password before storing it in the database
        password = data.get('password')
        hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
        insert_query = "INSERT INTO TempUsers (Username, Password, Email , FirstName , LastName , Phone ,  RoleID) VALUES (%s, %s , %s , %s , %s , %s , %s)"
        user_data = (data['username'], hashed_password, data['email'] , data["FirstName"] , data["LastName"] , data["Phone"] , data["RoleID"])
        cursor.execute(insert_query, user_data)
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'User registered successfully. Admin will activate your account soon' , 'statuscode' : 201 }), 201
    elif isUserExist is not None:
        return jsonify({'message': 'Username = ' + username + ' already exists', 'statuscode' : 409}), 409
    elif isEmailExist is not None:
        return jsonify({'message': 'Email = ' + email + ' already exists' , 'statuscode' : 409}), 409

# @auth_blueprint.route('/register', methods=['POST'])
# def register_user():
#     data = request.get_json()
#     conn = get_db()
#     cursor = conn.cursor()
#     username = data.get('username')
#     email = data.get('email')
#     cursor.execute("SELECT * FROM Users WHERE username = %s", (username,))
#     isUserExist = cursor.fetchone()
#     cursor.execute("SELECT * FROM Users WHERE email = %s", (email,))
#     isEmailExist = cursor.fetchone()
#     if isUserExist is None and isEmailExist is None:
#         # Hash the password before storing it in the database
#         password = data.get('password')
#         hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
#         insert_query = "INSERT INTO Users (username, password, email , FirstName , LastName , Phone , HighestAcademicQualificationUniversity , HighestAcademicQualificationCountry , RoleID) VALUES (%s, %s , %s , %s , %s , %s , %s , %s , %s )"
#         user_data = (data['username'], hashed_password, data['email'] , data["FirstName"] , data["LastName"] , data["Phone"] , data["HighestAcademicQualificationUniversity"] , data["HighestAcademicQualificationCountry"] , data["RoleID"])
#         cursor.execute(insert_query, user_data)
#         conn.commit()
#         cursor.close()
#         conn.close()
#         return jsonify({'message': 'User registered successfully'}), 201
#     elif isUserExist is not None:
#         return jsonify({'message': 'Username = ' + username + ' already exists'}), 409
#     elif isEmailExist is not None:
#         return jsonify({'message': 'Email = ' + email + ' already exists'}), 409

# Route for user login
@auth_blueprint.route('/login', methods=['POST'])
def login_user():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    username = data.get('username')
    cursor.execute("SELECT UserID, username, RoleID FROM Users WHERE username = %s", (username,))
    isUserExist = cursor.fetchone()

    if isUserExist:
        given_password = data.get('password')
        cursor.execute("SELECT password FROM Users WHERE username = %s", (username,))
        query_result = cursor.fetchone()
        hashed_password = query_result[0]
        if check_password_hash(hashed_password, given_password):
            # Check if the role ID in the request matches the role ID in the database
            if 'RoleID' in data and data['RoleID'] == isUserExist[2]:
                # create an access token with the user ID and return it
                access_token = create_access_token(identity=isUserExist[0])
                cursor.close()
                conn.close()
                return jsonify({'message': 'Login successful', 'user_id': isUserExist[0] , 'statuscode' : 200 , 'access_token': access_token}), 200
            else:
                cursor.close()
                conn.close()
                return jsonify({'message': 'Invalid RoleID', 'statuscode' : 403}), 403
        else:
            cursor.close()
            conn.close()
            return jsonify({'message': 'Invalid password', 'statuscode' : 401}), 401
    else:
        cursor.close()
        conn.close()
        return jsonify({'message': 'User not found' , 'statuscode' : 404}), 404


# Route for user logout
@auth_blueprint.route('/logout', methods=['POST'])
def logout_user():
    # Clear the user session on logout
    return jsonify({'message': 'Logout successful'}), 200

# ==========================================  Login & Register Related Routes END  =============================