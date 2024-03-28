import mysql.connector

# for pythonanywhere server
# db_config = {
#     'host': 'rakib73.mysql.pythonanywhere-services.com',
#     'user': 'rakib73',
#     'password': 'rakib73rakib73',
#     'database': 'rakib73$final_project'
# }

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'final_project'
}

# Function to establish a database connection
def get_db():
    return mysql.connector.connect(**db_config)

