import mysql.connector



db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'final_project'
}

# Function to establish a database connection
def get_db():
    return mysql.connector.connect(**db_config)

