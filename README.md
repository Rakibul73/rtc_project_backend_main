# Custom API Server for [PSTU RTC Project Management (Frontend)](https://github.com/Rakibul73/rtc_project_fronend)

This is a simple Flask-based API server that provides endpoints to interact with the project `PSTU RTC Project Management System`. It allows you to add data using both POST and GET methods and retrieve the stored data. This can be useful for various applications, including implementing a `Research & Training Center` management system.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Endpoints](#endpoints)

---

## Installation

To run this API server, you need Python and Flask installed on your system.

1. Clone this repository:

   ```bash
   git clone <repository_url>
   ```

2. Navigate to the project directory:

   ```bash
   cd rtc_project_backend
   ```

3. Install the required dependencies:

   ```bash
   pip install -r requirements.txt
   ```

4. Start the Flask development server:

   ```bash
   python api.py
   ```

The server should now be running at `http://localhost:5000`.

## Usage

You can interact with the API server using HTTP requests. You can use tools like `curl`, `Postman`, or create your own client application.

## Endpoints

`Some of the endpoints need valid access token`

### Authentication Endpoints

#### `POST /reset_password_request`

- Description: Request a password reset by providing an email address.
- Example Request:
  ```json
  {
    "email": "user@example.com"
  }
  ```
- Example Response:
  ```json
  {
    "message": "Password reset email sent",
    "statuscode": 200
  }
  ```

#### `POST /reset_password/<token>`

- Description: Reset password using a token received via email.
- Example Request:

  ```json
  {
    "new_password": "new_password_value"
  }
  ```

- Example Response:
  ```json
  {
    "message": "Password reset successfully",
    "statuscode": 200,
    "email": "user@example.com"
  }
  ```

#### `POST /register`

- Description: Register a new user.
- Example Request:
  ```json
  {
    "username": "newuser",
    "email": "newuser@example.com",
    "password": "password123",
    "FirstName": "John",
    "LastName": "Doe",
    "Phone": "1234567890",
    "RoleID": 1
  }
  ```
- Example Response:
  ```json
  {
    "message": "User registered successfully. Admin will activate your account soon",
    "statuscode": 201
  }
  ```

#### `POST /login`

- Description: Login with username and password to get an access token.
- Example Request:

  ```bash
  {
  "username": "user",
  "password": "password123",
  "RoleID": 1
  }
  ```

- Example Response:
  ```json
  {
    "message": "Login successful",
    "user_id": 123,
    "statuscode": 200,
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
  }
  ```

#### `POST /logout`

- Description: Logout and clear the access token.
- Example Request:
  ```bash
  curl -X POST http://localhost:5000/auth/logout -H "Authorization: Bearer <access_token>"
  ```
- Example Response:
  ```json
  {
    "message": "Logout successful",
    "statuscode": 200
  }
  ```

### File Download Endpoints

#### `GET /download/seal/download/<filename>`

- Description: Download a seal file.
- Authorization: Requires a valid access token with specific role permissions.
- Example Request in Postman:
  - Method: GET
  - URL: `http://localhost:5000/download/seal/download/seal1.png`
  - Headers:
    - Authorization: Bearer <access_token>
- Response: [Downloaded file content]

#### `GET /download/signature/download/<filename>`

- Description: Download a signature file.
- Authorization: Requires a valid access token with specific role permissions.
- Example Request in Postman:
  - Method: GET
  - URL: `http://localhost:5000/download/signature/download/signature1.png`
  - Headers:
    - Authorization: Bearer <access_token>
- Response: [Downloaded file content]

#### `GET /download/profile-pic/download/<filename>`

- Description: Download a profile picture file.
- Authorization: Requires a valid access token with specific role permissions.
- Example Request in Postman:
  - Method: GET
  - URL: `http://localhost:5000/download/profile-pic/download/profile_pic1.jpg`
  - Headers:
    - Authorization: Bearer <access_token>
- Response: [Downloaded file content]

#### `GET /download/methodology/download/<filename>`

- Description: Download a methodology file.
- Authorization: Requires a valid access token with specific role permissions.
- Example Request in Postman:
  - Method: GET
  - URL: `http://localhost:5000/download/methodology/download/methodology1.png`
  - Headers:
    - Authorization: Bearer <access_token>
- Response: [Downloaded file content]

#### `GET /download/nid/download/<filename>`

- Description: Download a NID (National Identification) file.
- Authorization: Requires a valid access token with specific role permissions.
- Example Request in Postman:
  - Method: GET
  - URL: `http://localhost:5000/download/nid/download/nid1.jpg`
  - Headers:
    - Authorization: Bearer <access_token>
- Response: [Downloaded file content]

#### `GET /download/project_softcopy/download/<filename>`

- Description: Download a project softcopy file.
- Authorization: Requires a valid access token with specific role permissions.
- Example Request in Postman:
  - Method: GET
  - URL: `http://localhost:5000/download/project_softcopy/download/project1.pdf`
  - Headers:
    - Authorization: Bearer <access_token>
- Response: [Downloaded file content]

### File Upload Endpoints

#### `POST /upload/seal/upload`

- Description: Upload a seal file.
- Authorization: Requires a valid access token with specific role permissions.
- Request Body: Form-data with key "file" containing the file to upload.
- Response:

```json
{
  "message": "Seal uploaded successfully",
  "statuscode": 200
}
```

#### `POST /upload/signature/upload`

- Description: Upload a signature file.
- Authorization: Requires a valid access token with specific role permissions.
- Request Body: Form-data with key "file" containing the file to upload.
- Response:
  ```json
  {
    "message": "Signature uploaded successfully",
    "statuscode": 200
  }
  ```

#### `POST /upload/profile-pic/upload`

- Description: Upload a profile picture file.
- Authorization: Requires a valid access token with specific role permissions.
- Request Body: Form-data with key "file" containing the file to upload.

- Response:
  ```json
  {
    "message": "Profile picture uploaded successfully",
    "statuscode": 200
  }
  ```

#### `POST /upload/methodology/upload`

- Description: Upload a methodology file.
- Authorization: Requires a valid access token with specific role permissions.
- Request Body: Form-data with key "file" containing the file to upload.
- Response:
  ```json
  {
    "message": "Methodology file uploaded successfully",
    "statuscode": 200
  }
  ```

#### `POST /upload/nid/upload`

- Description: Upload a NID (National Identification) file.
- Authorization: Requires a valid access token with specific role permissions.
- Request Body: Form-data with key "file" containing the file to upload.
- Response:
  ```json
  {
    "message": "NID file uploaded successfully",
    "statuscode": 200
  }
  ```

#### `POST /upload/project_softcopy/upload`

- Description: Upload a project softcopy file.
- Authorization: Requires a valid access token with specific role permissions.
- Request Body: Form-data with key "file" containing the file to upload.
- Response:
  ```json
  {
    "message": "Project softcopy file uploaded successfully",
    "statuscode": 200
  }
  ```

### User Endpoints

#### `GET /get_all_pending_users`

- Authorization: Admin or Supervisor role required.
- Response:
  ```json
  {
    "TempUsers": [
      {
        "UserID": 1,
        "Username": "john_doe",
        "Email": "john.doe@example.com",
        "FirstName": "John",
        "LastName": "Doe",
        "Phone": "123-456-7890",
        "RoleID": 2
      },
      {
        "UserID": 2,
        "Username": "jane_smith",
        "Email": "jane.smith@example.com",
        "FirstName": "Jane",
        "LastName": "Smith",
        "Phone": "987-654-3210",
        "RoleID": 3
      }
    ],
    "statuscode": 200
  }
  ```

#### `GET /get_specific_pending_user/<user_id>`

- Authorization: Admin role required.
- Response:
  ```json
  {
    "TempUser": {
      "UserID": 1,
      "Username": "john_doe",
      "Email": "john.doe@example.com",
      "FirstName": "John",
      "LastName": "Doe",
      "Phone": "123-456-7890",
      "RoleID": 2
    }
  }
  ```

#### `PUT /update_pending_user/<user_id>`

- Authorization: Specific role permissions required.
- Request Body:
  ```json
  {
    "Username": "updated_username",
    "Email": "updated.email@example.com",
    "FirstName": "Updated",
    "LastName": "User",
    "Phone": "999-888-7777",
    "RoleID": 3
  }
  ```
- Response:
  ```json
  {
    "message": "TempUser updated successfully",
    "statuscode": 200
  }
  ```

#### `GET /get_specific_user/<user_id>`

- Authorization: JWT required; roles 1, 2, 3, 4, or 5 allowed.
- Description: Fetches user details from the database based on the user ID.
- Response:
  ```json
  {
    "user": {
      "UserID": 1,
      "Username": "john_doe",
      "Email": "john.doe@example.com",
      "FirstName": "John",
      "LastName": "Doe",
      "Phone": "123-456-7890",
      "RoleID": 2,
      ...
    }
  }
  ```

#### `PUT /update_user/<user_id>`

- Authorization: JWT required; roles 1, 2, 3, 4, or 5 allowed.
- Description: updates the details of a specific user identified by `user_id`.
- Request Body:
  ```json
  {
    "Username": "updated_username",
    "Email": "updated.email@example.com",
    "FirstName": "Updated",
    "LastName": "User",
    "Phone": "999-888-7777",
    ...
  }
  ```
- Response:
  ```json
  {
    "message": "User updated successfully",
    "statuscode": 200
  }
  ```

#### `DELETE /delete_temp_user/<user_id>`

- Authorization: Admin role required.
- Response:
  ```json
  {
    "message": "Pending User with id 1 deleted successfully",
    "statuscode": 200
  }
  ```

#### `GET /get_user_name_of_specific_user/<user_id>`

- Authorization: JWT required; roles 1, 2, 3, 4, or 5 allowed.
- Description: Fetches the username of a user from the database based on the user ID.
- Response:
  ```json
  {
    "Username": "john_doe",
    "statuscode": 200
  }
  ```

#### `GET /get_all_users_except_students`

- Authorization: JWT required; roles 1, 2, 3, 4, or 5 allowed.
- Description: Fetches user details from the database for users excluding the student role.
- Response:
  ```json
  {
    "users": [
      {
        "Userid": 1,
        "Username": "john_doe",
        "FirstName": "John",
        "LastName": "Doe",
        "SignatureLocation": "path/to/signature",
        "SealLocation": "path/to/seal",
        "ProfilePicLocation": "path/to/profile_pic"
      },
      ...
    ],
    "statuscode": 200
  }
  ```

#### `GET /get_only_student_users`

- Authorization: JWT required; roles 1, 2, 3, 4, or 5 allowed.
- Description: Fetches user details from the database for users with the student role only.
- Response:
  ```json
  {
    "users": [
      {
        "Userid": 5,
        "Username": "student1",
        "FirstName": "Student",
        "LastName": "One",
        "SignatureLocation": "path/to/signature",
        "SealLocation": "path/to/seal"
      },
      ...
    ],
    "statuscode": 200
  }
  ```

#### `DELETE /approve_temp_user/<user_id>`

- Authorization: JWT required; only role 1 allowed (admin).
- Description: Approves a temporary user and moves them to the Users table while deleting them from TempUsers.
- Response:
  ```json
  {
    "message": "Pending UserID <user_id> approved successfully",
    "statuscode": 200
  }
  ```

#### `GET /user_management_overview`

- Authorization: Admin role required.
- Response:
  ```json
  {
    "total_users": 100,
    "total_pending_users": 10,
    "total_admin": 5,
    "total_researcher": 30,
    "total_reviewer": 20,
    "total_teacher": 15,
    "total_student": 30,
    "statuscode": 200
  }
  ```

#### `GET /get_specific_user_minimum/<user_id>`

- Authorization: JWT required; roles 1, 2, 3, 4, or 5 allowed.
- Description: Fetches minimal user details from the database based on the user ID, including username, first name, last name, and profile picture location.
- Response:
  ```json
  {
    "user": {
      "Username": "john_doe",
      "FirstName": "John",
      "LastName": "Doe",
      "ProfilePicLocation": "path/to/profile_pic"
    },
    "statuscode": 200
  }
  ```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---
