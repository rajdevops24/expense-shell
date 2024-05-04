source common.sh

HEADING Installing Web Server
dnf install nginx -y &> /tmp/expense.log
echo exit status - $?

HEADING Copying nginx config file..
cp expense.conf /etc/nginx/default.d/expense.conf &>> /tmp/expense.log
echo exit status - $?

HEADING Cleaning up old content ..
rm -rf /usr/share/nginx/html/* &>> /tmp/expense.log
echo exit status - $?

HEADING Downloading front end content..
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip &>> /tmp/expense.log
echo exit status - $?

cd /usr/share/nginx/html

HEADING Extracting content..
unzip /tmp/frontend.zip &>> /tmp/expense.log
echo exit status - $?

HEADING Restarting the service..
systemctl restart nginx &>> /tmp/expense.log
systemctl enable nginx &>> /tmp/expense.log
echo exit status - $?
