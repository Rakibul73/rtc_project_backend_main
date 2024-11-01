from flask import render_template, request, jsonify, Blueprint
from db import get_db  # local module
from werkzeug.security import generate_password_hash, check_password_hash
from flask_jwt_extended import create_access_token, get_jwt_identity, jwt_required, unset_jwt_cookies
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
    email_body = render_template(
        'email_template_passreset.html', reset_otp=reset_otp)

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
        return jsonify({'message': 'Email not found', 'statuscode': 404}), 404

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

    return jsonify({'message': 'Password reset email sent', 'statuscode': 200}), 200


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
        return jsonify({'message': 'Invalid token', 'statuscode': 404}), 404

    print(result)
    email = result[0]
    used = result[2]

    if used == 0:
        cursor.close()
        conn.close()
        return jsonify({'message': 'Token already used', 'statuscode': 400}), 400

    # Hash the new password
    hashed_password = generate_password_hash(
        new_password, method='pbkdf2:sha256')
    # Update the user's password
    cursor = conn.cursor()
    update_query = "UPDATE Users SET PASSWORD = %s WHERE Email = %s"
    user_data = (hashed_password, email)
    cursor.execute(update_query, user_data)
    cursor.execute(
        "UPDATE PassReset SET Used = 0 WHERE ResetToken = %s", (token,))
    conn.commit()
    cursor.close()
    conn.close()

    return jsonify({'message': 'Password reset successfully', 'statuscode': 200, 'email': email}), 200


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
        hashed_password = generate_password_hash(
            password, method='pbkdf2:sha256')
        insert_query = "INSERT INTO TempUsers (Username, Password, Email , FirstName , LastName , Phone ,  RoleID, FacultyName) VALUES (%s, %s , %s , %s , %s , %s , %s, %s)"
        user_data = (data['username'], hashed_password, data['email'],
                     data["FirstName"], data["LastName"], data["Phone"], data["RoleID"], data["FacultyName"])
        cursor.execute(insert_query, user_data)
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'User registered successfully. Admin will activate your account soon', 'statuscode': 201}), 201
    elif isUserExist is not None:
        return jsonify({'message': 'Username = ' + username + ' already exists', 'statuscode': 409}), 409
    elif isEmailExist is not None:
        return jsonify({'message': 'Email = ' + email + ' already exists', 'statuscode': 409}), 409

# Route for user login


@auth_blueprint.route('/login', methods=['POST'])
def login_user():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    username = data.get('username')
    cursor.execute(
        "SELECT UserID, username, RoleID FROM Users WHERE username = %s", (username,))
    isUserExist = cursor.fetchone()

    if isUserExist:
        given_password = data.get('password')
        cursor.execute(
            "SELECT password FROM Users WHERE username = %s", (username,))
        query_result = cursor.fetchone()
        hashed_password = query_result[0]
        if check_password_hash(hashed_password, given_password):
            # Check if the role ID in the request matches the role ID in the database
            if 'RoleID' in data and data['RoleID'] == isUserExist[2]:
                # create an access token with the user ID and return it
                access_token = create_access_token(identity=isUserExist[0], additional_claims={'origin': request.headers.get('Origin')})

                cursor.close()
                conn.close()
                return jsonify({'message': 'Login successful', 'user_id': isUserExist[0], 'statuscode': 200, 'access_token': access_token}), 200
            else:
                cursor.close()
                conn.close()
                return jsonify({'message': 'Invalid RoleID', 'statuscode': 403}), 403
        else:
            cursor.close()
            conn.close()
            return jsonify({'message': 'Invalid password', 'statuscode': 401}), 401
    else:
        cursor.close()
        conn.close()
        return jsonify({'message': 'User not found', 'statuscode': 404}), 404


# Route for user logout
@auth_blueprint.route('/logout', methods=['POST'])
@jwt_required()  # Protect the route with JWT
def logout_user():
    # Clear the JWT token from the client-side cookies
    response = jsonify({'message': 'Logout successful', 'statuscode': 200})
    unset_jwt_cookies(response)
    return response, 200

# ==========================================  Login & Register Related Routes END  =============================
