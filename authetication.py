from flask import  request, jsonify , session , Blueprint
from db import get_db # local module
from werkzeug.security import generate_password_hash, check_password_hash


auth_blueprint = Blueprint('auth', __name__)


# ========================================  Login & Register Related Routes START =============================


# Route for user registration
@auth_blueprint.route('/register', methods=['POST'])
def register_user():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    username = data.get('username')
    email = data.get('email')
    cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
    isUserExist = cursor.fetchone()
    cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
    isEmailExist = cursor.fetchone()
    if isUserExist is None and isEmailExist is None:
        # Hash the password before storing it in the database
        password = data.get('password')
        hashed_password = generate_password_hash(password, method='pbkdf2:sha256')
        insert_query = "INSERT INTO users (username, password, email , FirstName , LastName , Phone , HighestAcademicQualificationUniversity , HighestAcademicQualificationCountry , RoleID) VALUES (%s, %s , %s , %s , %s , %s , %s , %s , %s )"
        user_data = (data['username'], hashed_password, data['email'] , data["FirstName"] , data["LastName"] , data["Phone"] , data["HighestAcademicQualificationUniversity"] , data["HighestAcademicQualificationCountry"] , data["RoleID"])
        cursor.execute(insert_query, user_data)
        conn.commit()
        cursor.close()
        conn.close()
        return jsonify({'message': 'User registered successfully'}), 201
    elif isUserExist is not None:
        return jsonify({'message': 'Username = ' + username + ' already exists'}), 409
    elif isEmailExist is not None:
        return jsonify({'message': 'Email = ' + email + ' already exists'}), 409

# Route for user login
@auth_blueprint.route('/login', methods=['POST'])
def login_user():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    username = data.get('username')
    cursor.execute("SELECT UserID , username FROM users WHERE username = %s", (username,))
    isUserExist = cursor.fetchone()

    if isUserExist:
        given_password = data.get('password')
        cursor.execute("SELECT password FROM users WHERE username = %s", (username,))
        query_result = cursor.fetchone()
        hashed_password = query_result[0]
        if check_password_hash(hashed_password, given_password):
            # Set up a session for the logged-in user
            session['user_id'] = isUserExist[0]
            cursor.close()
            conn.close()
            return jsonify({'message': 'Login successful', 'user_id': isUserExist[0] }), 200
        else:
            cursor.close()
            conn.close()
            return jsonify({'message': 'Invalid password'}), 401


# Route for user logout
@auth_blueprint.route('/logout', methods=['POST'])
def logout_user():
    # Clear the user session on logout
    session.clear()
    return jsonify({'message': 'Logout successful'}), 200

# ==========================================  Login & Register Related Routes END  =============================