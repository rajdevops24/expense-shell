echo -e "\e[31mInstalling Mysql Server..\e[0m"
dnf install mysql-server -y &> /tmp/expensemysql.log
echo exit status - $?

echo -e "\e[31m Starting Services..\e[0m"
systemctl enable mysqld &>> /tmp/expensemysql.log
systemctl start mysqld &>> /tmp/expensemysql.log
echo exit status - $?

echo -e "\e[31m secure installation..\e[0m"
mysql_secure_installation --set-root-pass $1 &>> /tmp/expensemysql.log
echo exit status - $?
