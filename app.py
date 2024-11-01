import time
from flask import Flask, jsonify, session
from authetication import auth_blueprint
from review import review_blueprint
from projectuser import projectuser_blueprint
from student import student_blueprint
from project import project_blueprint
from user import user_blueprint
from flask_cors import CORS  # Add this line
from flask_jwt_extended import JWTManager
from functools import wraps
from datetime import timedelta
from upload import upload_blueprint
from download import download_blueprint
from notification import notification_blueprint
from fund import fund_blueprint
from fund_advance import fund_advance_blueprint
from monitoring import monitoring_blueprint
from notice import notice_blueprint
from flask_compress import Compress
from db import get_db
from mysql.connector import Error

app = Flask(__name__)
# CORS(app, resources={r"/*": {"origins": ["https://pstu-rtc.netlify.app", "http://localhost:5912"]}})
CORS(app, resources={r"/*": {"origins": "*"}})
Compress(app)


# Configure JWT
app.config['JWT_SECRET_KEY'] = 'rakibpstusecretkey'
# Set a longer token expiration time
app.config['JWT_ACCESS_TOKEN_EXPIRES'] = timedelta(
    hours=24)  # Example: 24 hours
jwt = JWTManager(app)

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

# Register the upload blueprint
app.register_blueprint(upload_blueprint)

# Register the download blueprint
app.register_blueprint(download_blueprint)

# Register the Notification blueprint
app.register_blueprint(notification_blueprint)

# Register the Fund blueprint
app.register_blueprint(fund_blueprint)

# Register the Fund blueprint
app.register_blueprint(fund_advance_blueprint)

# Register the monitoring blueprint
app.register_blueprint(monitoring_blueprint)

# Register the Notice blueprint
app.register_blueprint(notice_blueprint)


@app.route('/', methods=['GET'])
def index():
    return 'Welcome to the PSTU RTC Project Backend API!'


if __name__ == '__main__':
    # app.run(host='0.0.0.0', port=5000 , debug=True) # for docker only
    app.run(debug=False)
