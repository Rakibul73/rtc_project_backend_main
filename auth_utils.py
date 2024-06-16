from flask import request, jsonify
from flask_jwt_extended import get_jwt_identity
from db import get_db  # local module
from functools import wraps


def role_required(allowed_roles):
    def decorator(fn):
        @wraps(fn)
        def wrapper(*args, **kwargs):
            current_user_id = get_jwt_identity()
            # Get the role ID of the current user from the database or session
            role_id = get_role_id_from_database(current_user_id)
            # Check if the user's role is allowed to access the endpoint
            if role_id in allowed_roles:
                return fn(*args, **kwargs)
            else:
                return jsonify({'message': 'Unauthorized access'}), 403
        return wrapper
    return decorator

# Replace this function with your logic to get the role ID from the database


def get_role_id_from_database(user_id):
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute("SELECT RoleID FROM Users WHERE UserID = %s", (user_id,))
    RoleID = cursor.fetchone()
    return RoleID[0]
