from flask import Flask
import user , project , student , projectuser , review , authetication

app = Flask(__name__)


@app.route('/', methods=['GET'])
def index():
    return 'Welcome to the PSTU RTC Project Backend API!'




# ==========================================  User Related Routes START =============================
# Route to get all users
@app.route('/get_all_users', methods=['GET'])
def get_users():
    return user.get_all_users()


# Route to create a new user
@app.route('/create_users', methods=['POST'])
def create_user():
    return user.create_user()

# Route to get a specific user
@app.route('/get_specific_user/<int:user_id>', methods=['GET'])
def get_specific_user(user_id):
    return user.get_specific_user(user_id)

# Route to update a user
@app.route('/update_user/<int:user_id>', methods=['PUT'])
def update_user(user_id):
    return user.update_user(user_id)

# Route to delete a user
@app.route('/delete_user/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    return user.delete_user(user_id)

# fetch role of a specific user
@app.route('/get_user_role_of_specific_user/<int:user_id>', methods=['GET'])
def get_user_role_of_specific_user(user_id):
    return user.get_user_role_of_specific_user(user_id)

# ==========================================  User Related Routes END =============================


# ==========================================  Project Related Routes START =============================
# Route to get all projects
@app.route('/projects', methods=['GET'])
def get_projects():
    return project.get_all_projects()


# Route to create a new project
@app.route('/projects', methods=['POST'])
def create_project():
    return project.create_project()


# Route to get a specific project
@app.route('/projects/<int:project_id>', methods=['GET'])
def get_project(project_id):
    return project.get_specific_project(project_id)

# Route to update a project
@app.route('/projects/<int:project_id>', methods=['PUT'])
def update_project(project_id):
    return project.update_project(project_id)


# Route to delete a project
@app.route('/projects/<int:project_id>', methods=['DELETE'])
def delete_project(project_id):
    return project.delete_project(project_id)

# ==========================================  Project Related Routes END  =============================
# ==========================================  Student Related Routes START =============================

# Route to get all students
@app.route('/get_all_students', methods=['GET'])
def get_all_students():
    return student.get_all_students()

# Route to create a new student
@app.route('/create_student', methods=['POST'])
def create_student():
    return student.create_student()

# Route to get a specific student
@app.route('/get_specific_student/<int:student_id>', methods=['GET'])
def get_specific_student(student_id):
    return student.get_specific_student(student_id)

# Route to delete a student
@app.route('/delete_student/<int:student_id>', methods=['DELETE'])
def delete_student(student_id):
    return student.delete_student(student_id)

# Route to update a student
@app.route('/update_student/<int:student_id>', methods=['PUT'])
def update_student(student_id):
    return student.update_student(student_id)


# ==========================================  Student Related Routes END  =============================

# ==========================================  Project_User Related Routes START =============================


# Route to get all projects for specific userID
@app.route('/get_all_projects_for_specific_user/<int:user_id>', methods=['GET'])
def get_all_projects_for_specific_user(user_id):
    return projectuser.get_all_projects_for_specific_user(user_id)


# Route to get a specific project with userID
@app.route('/get_specific_project_for_specific_user/<int:project_id>/<int:user_id>', methods=['GET'])
def get_specific_project_for_specific_user(project_id, user_id):
    return projectuser.get_specific_project_for_specific_user(project_id, user_id)

# Route to delete a project with user ID
@app.route('/delete_project_with_user/<int:project_id>/<int:user_id>', methods=['DELETE'])
def delete_project_with_user(project_id, user_id):
    return projectuser.delete_project_with_user(project_id, user_id)


# Route to delete all projects for a specific user
@app.route('/delete_projects_for_specific_user/<int:user_id>', methods=['DELETE'])
def delete_projects_for_specific_user(user_id):
    return projectuser.delete_projects_for_specific_user(user_id)


# ==========================================  Project_User Related Routes END  =============================

# ==========================================  Review Related Routes START =============================

# Route to get all reviews for a specific project
@app.route('/get_reviews_for_specific_project/<int:project_id>', methods=['GET'])
def get_reviews_for_specific_project(project_id):
    return review.get_reviews_for_specific_project(project_id)

# Route to create a new review for a specific project
@app.route('/create_reviews_specific_project', methods=['POST'])
def create_reviews_specific_project():
    return review.create_reviews_specific_project()

# Route to update a specific project review
@app.route('/update_specific_project_review/<int:review_id>', methods=['PUT'])
def update_specific_project_review(review_id):
    return review.update_specific_project_review(review_id)

# Route to delete a specific project review
@app.route('/delete_specific_project_review/<int:review_id>', methods=['DELETE'])
def delete_specific_project_review(review_id):
    return review.delete_specific_project_review(review_id)

# Route to get all reviews for a specific reviewer user
@app.route('/get_all_reviews_for_specific_reviewer/<int:reviewer_user_id>', methods=['GET'])
def get_all_reviews_for_specific_reviewer(reviewer_user_id):
    return review.get_all_reviews_for_specific_reviewer(reviewer_user_id)


# Route to delete all reviews for a specific project
@app.route('/delete_all_reviews_for_specific_project/<int:project_id>', methods=['DELETE'])
def delete_all_reviews_for_specific_project(project_id):
    return review.delete_all_reviews_for_specific_project(project_id)

# ==========================================  Review Related Routes END  =============================


# ========================================  Login & Register Related Routes START =============================


# Route for user registration
@app.route('/register', methods=['POST'])
def register_user():
    return authetication.register_user()

# Route for user login
@app.route('/login', methods=['POST'])
def login_user():
    return authetication.login_user()


# Route for user logout
@app.route('/logout', methods=['POST'])
def logout_user():
    return authetication.logout_user()

# ==========================================  Login & Register Related Routes END  =============================

if __name__ == '__main__':
    app.run(debug=True)
