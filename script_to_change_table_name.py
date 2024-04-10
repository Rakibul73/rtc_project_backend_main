# drop table ActivityPlan;
# drop table BudgetPlan;
# drop table Notification;
# drop table PassReset;
# drop table ProjectFund;
# drop table ProjectListWithReviewerID;
# drop table ProjectListWithUserID;
# drop table Review;
# drop table TempUsers;
# drop table Projects;
# drop table Users;
# drop table Role;


# use rakib73$final_project; source /home/rakib73/mysite/rtc_project_backend/pstu_rtc.sql;


# mysqldump -u rakib73 -h rakib73.mysql.pythonanywhere-services.com --set-gtid-purged=OFF --no-tablespaces 'rakib73$final_project'  > db-backup.sql


import re

# Define the mapping of old table names to new table names
table_name_mappings = {
    "activityplan": "ActivityPlan",
    "budgetplan": "BudgetPlan",
    "notification": "Notification",
    "passreset": "PassReset",
    "projectfund": "ProjectFund",
    "projectlistwithreviewerid": "ProjectListWithReviewerID",
    "projectlistwithuserid": "ProjectListWithUserID",
    "review": "Review",
    "tempusers": "TempUsers",
    "projects": "Projects",
    "users": "Users",
    "role": "Role",
    # Add more mappings here if needed
}

# Read the content of the original SQL file
with open('pstu_rtc.sql', 'r', encoding='utf-8') as file:
    sql_content = file.read()

# Replace table names using regular expressions for all occurrences
for old_table, new_table in table_name_mappings.items():
    sql_content = re.sub(r'`{}`'.format(old_table), '`{}`'.format(new_table), sql_content, flags=re.IGNORECASE, count=0)

# Write the modified content to a new file
with open('pstu_rtc_modified.sql', 'w', encoding='utf-8') as file:
    file.write(sql_content)

print("      Table names replaced successfully         ")