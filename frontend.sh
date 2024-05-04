echo -e "\e[31mInstalling Web Server..\e[0m"
dnf install nginx -y
echo exit status - $?

echo -e "\e[31mCopying nginx config file..\e[0m"
cp expense.conf /etc/nginx/default.d/expense.conf
echo exit status - $?

echo -e "\e[31mCleaning up old content ..\e[0m"
rm -rf /usr/share/nginx/html/*
echo exit status - $?

echo -e "\e[31mDownloading front end content..\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip
echo exit status - $?

cd /usr/share/nginx/html

echo -e "\e[31mExtracting content..\e[0m"
unzip /tmp/frontend.zip
echo exit status - $?

echo -e "\e[31mRestarting the service..\e[0m"
systemctl restart nginx
systemctl enable nginx
echo exit status - $?