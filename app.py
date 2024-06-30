from flask import Flask, session
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
import git  # GitPython library
from db import get_db
from mysql.connector import Error

app = Flask(__name__)
CORS(app)  # Add this line
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

@app.route('/git_update', methods=['POST'])
def git_update():
    """
    Update the git repository with the latest changes from the remote and switch to the main branch.
    Returns:
        tuple: A tuple in the format (None, 200) indicating a successful update.
    """
    repo = git.Repo('./mysite/rtc_project_backend')
    origin = repo.remotes.origin
    # Stash local changes
    repo.git.stash()
    # repo.create_head('main', origin.refs.main).set_tracking_branch(origin.refs.main).checkout()
    origin.pull()
    return '', 200



def drop_tables(connection, cursor):
    tables = [
        "ActivityPlan",
        "ProjectMonitoringReportBudget",
        "ProjectMonitoringReportActivity",
        "BudgetPlanHistory",
        "ActivityPlanHistory",
        "ActivityPlanOriginal",
        "BudgetPlanOriginal",
        "ProjectReportListWithMonitoringCommitteeID",
        "ProjectMonitoringFeedback",
        "ProjectMonitoringReport",
        "BudgetPlan",
        "Notification",
        "PassReset",
        "ProjectFund",
        "ProjectAdvanceFund",
        "ProjectListWithReviewerID",
        "ProjectListWithUserID",
        "Review",
        "TempUsers",
        "Projects",
        "Users",
        "Role",
        "Notice"
    ]

    for table in tables:
        try:
            cursor.execute(f"DROP TABLE IF EXISTS {table};")
            print(f"Dropped table {table}")
        except Error as e:
            print(f"Error: {e}")
            connection.rollback()

def import_sql_file(connection, cursor, sql_file_path):
    try:
        with open(sql_file_path, 'r') as file:
            sql_commands = file.read()
        for command in sql_commands.split(';'):
            if command.strip():
                cursor.execute(command)
        connection.commit()
        print("SQL file imported successfully")
    except Error as e:
        print(f"Error: {e}")
        connection.rollback()
    except FileNotFoundError as fnfe:
        print(f"File not found: {fnfe}")


@app.route('/mysql_db_update', methods=['POST'])
def git_update():
    sql_file_path = './mysite/rtc_project_backend/pstu_rtc.sql'
    conn = get_db()
    cursor = conn.cursor()
    drop_tables(conn, cursor)
    import_sql_file(conn, cursor, sql_file_path)
    return '', 200



if __name__ == '__main__':
    # app.run(host='0.0.0.0', port=5000 , debug=True) # for docker only
    app.run(debug=True)
