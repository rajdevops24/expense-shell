source common.sh

HEADING Installing Web Server
dnf install nginx -y &> /tmp/expense.log
STAT $?

HEADING Copying nginx config file..
cp expense.conf /etc/nginx/default.d/expense.conf &>> /tmp/expense.log
STAT $?

HEADING Cleaning up old content ..
rm -rf /usr/share/nginx/html/* &>> /tmp/expense.log
STAT $?

HEADING Downloading front end content..
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>> /tmp/expense.log
STAT $?

cd /usr/share/nginx/html

HEADING Extracting content..
unzip /tmp/frontend.zip &>> /tmp/expense.log
STAT $?

HEADING Restarting the service..
systemctl restart nginx &>> /tmp/expense.log
systemctl enable nginx &>> /tmp/expense.log
STAT $?
