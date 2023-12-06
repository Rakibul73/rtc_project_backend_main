from flask import  request, jsonify
from db import get_db # local module


# Route to get all users
def get_all_users():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users")
    users = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify({'users': users})

# Route to create a new user
def create_user():
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    insert_query = "INSERT INTO users (username, password, email) VALUES (%s, %s , %s)"
    user_data = (data['username'], data['password'], data['email'])
    cursor.execute(insert_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'User created successfully'}), 201

# Route to get a specific user
def get_specific_user(user_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users WHERE Userid = %s", (user_id,))
    user = cursor.fetchone()
    cursor.close()
    conn.close()
    if user:
        return jsonify({'user': user})
    else:
        return jsonify({'message': 'User not found'}), 404

# Route to update a user
def update_user(user_id):
    data = request.get_json()
    conn = get_db()
    cursor = conn.cursor()
    update_query = "UPDATE users SET username = %s, password = %s, email = %s , ProfilePicLocation = %s WHERE Userid = %s"
    user_data = (data['username'], data['password'], data['email'], data['ProfilePicLocation'], user_id)
    cursor.execute(update_query, user_data)
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'User updated successfully'})

# Route to delete a user
def delete_user(user_id):
    conn = get_db()
    cursor = conn.cursor()
    delete_query = "DELETE FROM users WHERE Userid = %s"
    cursor.execute(delete_query, (user_id,))
    conn.commit()
    cursor.close()
    conn.close()
    return jsonify({'message': 'User with id ' + str(user_id) + ' deleted successfully'})
