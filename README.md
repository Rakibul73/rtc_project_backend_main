# Custom API Server for [PSTU RTC Project Management (Frontend)](https://github.com/Rakibul73/rtc_project_fronend)

This is a simple Flask-based API server that provides endpoints to interact with the project `PSTU RTC Project Management System`. It allows you to add data using both POST and GET methods and retrieve the stored data. This can be useful for various applications, including implementing a `Research & Training Center` management system.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Authentication Endpoints](#authentication-endpoints)
- [File Download Endpoints](#file-download-endpoints)
- [File Upload Endpoints](#file-upload-endpoints)
- [User Endpoints](#user-endpoints)
- [Reviewer Endpoints](#reviewer-endpoints)
- [ProjectUser Endpoints](#projectuser-endpoints)
- [Project Endpoints](#project-endpoints)
- [Notification Endpoints](#notification-endpoints)

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

> Some of the endpoints need valid access token

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

### Reviewer Endpoints

#### `POST /set_reviewer_for_specific_project`

- Authorization: Requires JWT authentication; accessible to role 1.
- Description: Creates a new review for a project by setting a reviewer based on the provided ProjectID and ReviewerUserID.
- Request Body: JSON
  ```json
  {
    "ProjectID": 123,
    "ReviewerUserID": 456
  }
  ```
- Response:
  ```json
  {
    "message": "Reviewer Set successfully",
    "statuscode": 201
  }
  ```

#### `GET /get_revieweruserid_for_specific_project/<int:project_id>`

- Authorization: Requires JWT authentication; accessible to role 1.
- Description: Fetches all ReviewerUserIDs associated with a specific project based on the provided project ID.
- Response:
  ```json
  {
    "revieweruserid": [{ "ReviewerUserID": 123 }, { "ReviewerUserID": 456 }],
    "statuscode": 200
  }
  ```

#### `GET /review_dashboard`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Retrieves the total number of projects to review, completed reviews, pending reviews, review queue, and other relevant information for the review dashboard.
- Response:
  ```json
  {
    "total_projects_to_review": 10,
    "completed_reviews": 5,
    "review_queue": 3,
    "pending_reviews": 5,
    "review_done": 2,
    "my_total_project": 7,
    "statuscode": 200
  }
  ```

#### `GET /update_picanviewornot/<int:project_id>`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Updates the PiCanViewOrNot status for a specific project, where 0 means cannot view and 1 means can view.
- Response:
  ```json
  {
    "message": "Review PiCanViewOrNot updated successfully",
    "statuscode": 200
  }
  ```

#### `GET /get_all_projects_pi_can_view_review`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Retrieves all projects that a PI (Principal Investigator) can view for review.
- Response:
  ```json
  {
    "ProjectsPiCanViewReview": [
      {
        "ProjectID": 1,
        "ProjectTitle": "Research Project 1",
        "Description": "This is the description of the project 1.",
        ...
      },
      {
        "ProjectID": 2,
        "ProjectTitle": "Research Project 2",
        "Description": "This is the description of the project 2.",
        ...
      },
      ...
    ],
    "statuscode": 200
  }
  ```

#### `GET /get_all_projects_have_to_review`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Retrieves all projects that the current user has to review.
- Response:
  ```json
  {
    "ProjectHaveToReviewList": [
      {
        "ProjectID": 1,
        "ProjectTitle": "Research Project 1",
        "Description": "This is the description of the project 1.",
        ...
      },
      {
        "ProjectID": 3,
        "ProjectTitle": "Research Project 3",
        "Description": "This is the description of the project 3.",
        ...
      },
      ...
    ],
    "statuscode": 200
  }
  ```

#### `GET /check_a_project_reviewed_or_not/<project_id>/<user_id>`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Checks whether a specific project has been reviewed by a specific user.
- Response:
  - If the project is reviewed:
    ```json
    {
      "ProjectReviewCheck": "Yes",
      "statuscode": 200
    }
    ```
  - If the project is not reviewed:
    ```json
    {
      "ProjectReviewCheck": "No",
      "statuscode": 200
    }
    ```

#### `GET /get_reviews_for_specific_project/<project_id>`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Retrieves all reviews for a specific project based on the project ID.
- Response:
  ```json
  {
    "reviews": [
      {
        "ReviewID": 1,
        "ProjectID": 1,
        "ReviewerUserID": 123,
        "Comments": "This is a review comment for the project.",
        "Points": 4.5,
        "PiCanViewOrNot": 0,
        ...
      },
      {
        "ReviewID": 2,
        "ProjectID": 1,
        "ReviewerUserID": 456,
        "Comments": "Another review comment for the project.",
        "Points": 3.5,
        "PiCanViewOrNot": 1,
        ...
      },
      ...
    ],
    "statuscode": 200
  }
  ```

#### `POST /create_reviews_specific_project`

- Authorization: Requires JWT authentication; accessible to roles 2, 3, 4, and 5.
- Description: Creates a new review for a specific project.
- Request Body:
  ```json
  {
    "ProjectID": 1,
    "ReviewerUserID": 123,
    "Comments": "This is a review comment for the project.",
    "Points": 4.5
  }
  ```
- Response:
  ```json
  {
    "message": "Review created successfully",
    "statuscode": 201
  }
  ```

#### `POST /get_all_reviews_for_specific_reviewer`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Retrieves all reviews for a specific reviewer user and project.
- Request Body:
  ```json
  {
    "ProjectID": 1,
    "ReviewerUserID": 123
  }
  ```
- Response:
  ```json
  {
    "reviews": [
      {
        "ReviewID": 1,
        "ProjectID": 1,
        "ReviewerUserID": 123,
        "Comments": "This is a review comment for the project.",
        "Points": 4.5,
        "PiCanViewOrNot": 0,
        ...
      },
      {
        "ReviewID": 2,
        "ProjectID": 1,
        "ReviewerUserID": 123,
        "Comments": "Another review comment for the project.",
        "Points": 3.5,
        "PiCanViewOrNot": 1,
        ...
      },
      ...
    ],
    "statuscode": 200
  }
  ```

#### `GET /review_panel_overview`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Provides an overview of the review panel statistics, including the number of reviewers who have given reviews, the number of projects that still need reviewers assigned, and the total number of projects and assigned reviewers.
- Response:
  ```json
  {
    "reviewer_gave_review": 15,
    "need_to_assign_reviewer": 5,
    "assigned_reviewer": 20,
    "statuscode": 200
  }
  ```

#### `GET /get_all_projects_have_to_set_reviewer`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Retrieves a list of all projects that still need a reviewer assigned.
- Response:
  ```json
  {
    "ProjectHaveToSetReviewerList": [
      {
        "ProjectID": 1,
        "ProjectTitle": "Sample Project 1",
        ...
      },
      {
        "ProjectID": 2,
        "ProjectTitle": "Sample Project 2",
        ...
      },
      ...
    ],
    "statuscode": 200
  }
  ```

#### `GET /get_all_projects_reviewer_given_review`

- Authorization: Requires JWT authentication; accessible only to role 1 (admin).
- Description: Retrieves a list of all projects where reviewers have given their reviews.
- Response:
  ```json
  {
    "projects": [
      {
        "ProjectID": 1,
        "ProjectTitle": "Sample Project 1",
        ...
      },
      {
        "ProjectID": 2,
        "ProjectTitle": "Sample Project 2",
        ...
      },
      ...
    ],
    "statuscode": 200
  }
  ```

### ProjectUser Endpoints

#### `GET /get_total_number_of_all_dashboard`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Retrieves various counts related to users and projects, including total users, projects, admins, researchers, reviewers, teachers, students, and projects with reports.
- Response:
  ```json
  {
    "total_users": 100,
    "total_projects": 50,
    "total_admin": 5,
    "total_researcher": 20,
    "total_reviewer": 10,
    "total_teacher": 8,
    "total_student": 57,
    "total_project_report": 30,
    "statuscode": 200
  }
  ```

#### `GET /get_self_project_dashboard`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Retrieves project-related statistics for the current user, including completed, total, pending, approved, rejected, running projects, and final reports submitted.
- Response:
  ```json
  {
    "running_projects": 5,
    "rejected_projects": 2,
    "approved_projects": 15,
    "pending_projects": 10,
    "final_report_submitted": 20,
    "completed_projects": 30,
    "total_projects": 50,
    "statuscode": 200
  }
  ```

### Project Endpoints

#### `GET /get_project_status_specific_project/<int:project_id>`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Retrieves the status of a specified project.
- Response:
  ```json
  {
    "ProjectStatus": "Running",
    "statuscode": 200
  }
  ```

#### `PUT /update_projectstatus_point/<int:project_id>`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Updates the project status and total points of a specific project.
- Request Body Example:
  ```json
  {
    "ProjectStatus": "Approved",
    "TotalPoints": 100
  }
  ```
- Response:
  ```json
  {
    "message": "Project Status & Total Points updated successfully",
    "statuscode": 200
  }
  ```

#### `GET /projects`

- Authorization: Requires JWT authentication; accessible to role 1 (admin).
- Description: Retrieves all projects.
- Response:

  ```json
  {
  "projects": [
    {
      "ProjectID": 1,
      "ProjectTitle": "Sample Project 1",
      "CreatorUserID": 123,
      ...
    },
    {
      "ProjectID": 2,
      "ProjectTitle": "Sample Project 2",
      "CreatorUserID": 456,
      ...
    },
    ...
  ],
  "statuscode": 200
  }
  ```

#### `POST /create_projects`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5.
- Description: Creates a new project.
- Request Body Example:

  ```json
  {
    "CodeByRTC": "ABC123",
    "DateRecieved": "2024-04-03",
    "ProjectTitle": "Research Project Title",
    "NatureOfResearchProposal": "Nature of Research Proposal",
    ...
  }
  ```

- Response:
  ```json
  {
    "message": "Project created successfully",
    "statuscode": 201
  }
  ```

#### `GET /projects/<int:project_id>`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, and 4.
- Description: Retrieves details of a specific project.
- Response:
  ```json
  {
    "project": {
      "ProjectID": 1,
      "ProjectTitle": "Sample Project",
      "CreatorUserID": 123,
      "ProjectStatus": "Pending",
      ...
    },
    "statuscode": 200
  }
  ```

#### `DELETE /projects/<int:project_id>`

- Authorization: Requires JWT authentication; accessible to role 1 (admin).
- Description: Deletes a project and its related data.
- Response:
  ```json
  {
    "message": "Project with id 123 deleted successfully",
    "statuscode": 200
  }
  ```

#### `PUT /update_project/<int:project_id>`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, and 4.
- Description: Updates the basic information of a project.
- Request Body Example:

  ```json
  {
    "CodeByRTC": "12345",
    "ProjectTitle": "Updated Project Title",
    "NatureOfResearchProposal": "Updated Proposal",
    ...
  }
  ```

- Response:
  ```json
  {
    "message": "Project updated successfully",
    "statuscode": 200
  }
  ```

#### `GET /get_admin_project_dashboard`

- Authorization: Requires JWT authentication; accessible only to users with role 1 (admin).
- Description: Fetches a dashboard containing statistics related to projects in the system, such as the count of completed, pending, approved, rejected, running projects, and the number of final reports submitted.
- Response:
  ```json
  {
    "running_projects": 3,
    "rejected_projects": 1,
    "approved_projects": 5,
    "pending_projects": 2,
    "final_report_submitted": 8,
    "completed_projects": 15,
    "total_projects": 34,
    "statuscode": 200
  }
  ```

#### `GET /myprojects/user/<int:user_id>`

- Authorization: Requires JWT authentication.
- Description: Retrieves all projects associated with the self user.
- Response:
  ```json
  {
    "projects": [
      {
        "ProjectID": 1,
        "ProjectTitle": "Project 1",
        ...
      },
      {
        "ProjectID": 2,
        "ProjectTitle": "Project 2",
        ...
      },
      ...
    ],
    "statuscode": 200
  }
  ```

### Notification Endpoints

#### `POST /request_project_deletion_to_admin/<int:project_id>`

- Authorization: Requires JWT authentication; accessible to roles 2, 3, 4, and 5 (teachers).
- Description: Allows teachers to request project deletion to the admin.
- Request Body Example:
  ```json
  {
    "CodeByRTC": "12345",
    "ProjectTitle": "Updated Project Title",
    "NatureOfResearchProposal": "Updated Proposal",
    ...
  }
  ```
- Response:
  ```json
  {
    "message": "Project deletion request sent successfully",
    "statuscode": 200
  }
  ```

#### `DELETE /delete_project_request/<int:notification_id>`

- Authorization: Requires JWT authentication; accessible to role 1 (admin).
- Description: Allows the admin to delete a project requested for deletion based on the notification ID.
- Response:
  ```json
  {
    "message": "Project with id {project_id} deleted successfully",
    "statuscode": 200
  }
  ```

#### `GET /get_self_notification`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5 (admin and supervisors).
- Description: Retrieves notifications for the current user (admin or supervisor) in descending order based on timestamp.
- Response Example:
  ```json
  {
    "MyNotifications": [...],
    "statuscode": 200
  }
  ```

#### `PUT /mark_as_unread/<int:notification_id>` and `PUT /mark_as_read/<int:notification_id>`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5 (teachers).
- Description: Marks a notification as unread or read based on the notification ID.
- Response Example (for both endpoints):
  ```json
  {
    "message": "Notification marked as unread/read successfully",
    "statuscode": 200
  }
  ```

#### `GET /get_all_notification`

- Authorization: Requires JWT authentication; accessible to role 1 (admin).
- Description: Retrieves all notifications in descending order based on timestamp.
- Response Example:
  ```json
  {
    "AllNotifications": [...],
    "statuscode": 200
  }
  ```

#### `PUT /mark_all_as_read`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, 4, and 5 (teachers).
- Description: Marks all notifications for the current user as read.
- Response Example:
  ```json
  {
    "message": "Notification marked as read successfully",
    "statuscode": 200
  }
  ```

#### `GET /get_specific_notification/<int:notification_id>`

- Authorization: Requires JWT authentication; accessible to roles 1, 2, 3, and 4.
- Description: Retrieves a specific notification based on the notification ID.
- Response Example:
  ```json
  {
    "Notification": {...},
    "statuscode": 200
  }
  ```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---
