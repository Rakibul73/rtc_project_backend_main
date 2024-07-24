# test_authetication.py
import pytest
from unittest.mock import patch, MagicMock
from flask import Flask
from flask_jwt_extended import JWTManager
from authetication import auth_blueprint

@pytest.fixture
def client():
    app = Flask(__name__)
    app.config['SECRET_KEY'] = 'super-secret'
    app.config['JWT_SECRET_KEY'] = 'jwt-secret-string'
    jwt = JWTManager(app)
    app.register_blueprint(auth_blueprint, url_prefix='/auth')
    with app.test_client() as client:
        yield client

@patch('authetication.get_db')
@patch('authetication.send_email')
def test_reset_password_request(mock_send_email, mock_get_db, client):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_get_db.return_value = mock_conn
    mock_conn.cursor.return_value = mock_cursor
    mock_cursor.fetchone.return_value = ('user@example.com',)

    data = {'email': 'user@example.com'}
    response = client.post('/auth/reset_password_request', json=data)

    assert response.status_code == 200
    assert response.json['message'] == 'Password reset email sent'
    mock_send_email.assert_called_once()

@patch('authetication.get_db')
def test_reset_password(mock_get_db, client):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_get_db.return_value = mock_conn
    mock_conn.cursor.return_value = mock_cursor
    mock_cursor.fetchone.return_value = ('user@example.com', 'token', 1)

    data = {'new_password': 'new_password123'}
    response = client.post('/auth/reset_password/token', json=data)

    assert response.status_code == 200
    assert response.json['message'] == 'Password reset successfully'

@patch('authetication.get_db')
def test_register_user(mock_get_db, client):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_get_db.return_value = mock_conn
    mock_conn.cursor.return_value = mock_cursor
    mock_cursor.fetchone.side_effect = [None, None]

    data = {
        'username': 'automation_test',
        'email': 'automation_test@example.com',
        'password': 'automation_test',
        'FirstName': 'automation',
        'LastName': 'test',
        'Phone': '1234567890',
        'RoleID': 1
    }
    response = client.post('/auth/register', json=data)

    assert response.status_code == 201
    assert response.json['message'] == 'User registered successfully. Admin will activate your account soon'

@patch('authetication.get_db')
def test_login_user(mock_get_db, client):
    mock_conn = MagicMock()
    mock_cursor = MagicMock()
    mock_get_db.return_value = mock_conn
    mock_conn.cursor.return_value = mock_cursor
    mock_cursor.fetchone.side_effect = [
        (1, 'automation_test', 1),  # User exists
        ('pbkdf2:sha256:600000$Knz5PIYdWrqFZn6u$c302f0afe6cffc9fc6245ac78cddeb5591437416d9097b3923e8adc7201140b3',)  # Hashed password
    ]

    data = {
        'username': 'automation_test',
        'password': 'automation_test',
        'RoleID': 1
    }
    response = client.post('/auth/login', json=data)

    assert response.status_code == 200
    assert response.json['message'] == 'Login successful'
    assert 'access_token' in response.json
    
