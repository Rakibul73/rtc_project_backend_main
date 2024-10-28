import mysql.connector

# for pythonanywhere server
# db_config = {
#     'host': 'rakib73.mysql.pythonanywhere-services.com',
#     'user': 'rakib73',
#     'password': 'rakib73rakib73',
#     'database': 'rakib73$final_project'
# }

db_config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'rakib',
    'database': 'pstu_rtc'
}


# db_config = {
#     'host': '0.tcp.in.ngrok.io',
#     'port': 12196,  # The dynamic port provided by ngrok
#     'user': 'root',  # Same as your local MySQL user
#     'password': '',  # Same as your local MySQL password
#     'database': 'pstu_rtc'
# }


# Function to establish a database connection


def get_db():
    return mysql.connector.connect(**db_config)
