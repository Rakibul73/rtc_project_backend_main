from flask import Blueprint, jsonify
from db import get_db
from mysql.connector import Error
# import git  # GitPython library
from db import get_db

github_webhook_blueprint = Blueprint('github_webhook', __name__)


@github_webhook_blueprint.route('/git_update', methods=['POST'])
def git_update():
    """
    Update the git repository with the latest changes from the remote and switch to the main branch.
    Returns:
        tuple: A tuple in the format (None, 200) indicating a successful update.
    """
    repo = git.Repo('./mysite/rtc_project_backend')
    origin = repo.remotes.origin
    repo.git.stash() # Stash local changes
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

def show_tables(connection, cursor):
    tables = []
    try:
        cursor.execute("SHOW TABLES;")
        tables = cursor.fetchall()
    except Error as e:
        print(f"Error: {e}")
    return [table[0] for table in tables]

@github_webhook_blueprint.route('/mysql_db_update', methods=['POST'])
def mysql_db_update():
    sql_file_path = './mysite/rtc_project_backend/pstu_rtc.sql'
    conn = get_db()
    cursor = conn.cursor()
    tables = show_tables(conn, cursor)
    drop_tables(conn, cursor)
    import_sql_file(conn, cursor, sql_file_path)
    return jsonify(tables=tables), 200

