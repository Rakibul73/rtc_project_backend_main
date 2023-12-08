from flask import Flask , session
from authetication import auth_blueprint
from review import review_blueprint
from projectuser import projectuser_blueprint
from student import student_blueprint
from project import project_blueprint
from user import user_blueprint

app = Flask(__name__)


# Set a secret key for session management
app.secret_key = 'rakibpstusecretkey'

# Register the authentication blueprint
app.register_blueprint(auth_blueprint)

# Register the review blueprint
app.register_blueprint(review_blueprint)

# Register the projectuser blueprint
app.register_blueprint(projectuser_blueprint)

# Register the student blueprint
app.register_blueprint(student_blueprint)

# Register the project blueprint
app.register_blueprint(project_blueprint)

# Register the user blueprint
app.register_blueprint(user_blueprint)

@app.route('/', methods=['GET'])
def index():
    return 'Welcome to the PSTU RTC Project Backend API!'


if __name__ == '__main__':
    app.run(debug=True)
