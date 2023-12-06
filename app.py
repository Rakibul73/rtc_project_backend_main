from flask import Flask
import user , project

app = Flask(__name__)


@app.route('/', methods=['GET'])
def index():
    return 'Welcome to the PSTU RTC Project Backend API!'

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



if __name__ == '__main__':
    app.run(debug=True)
