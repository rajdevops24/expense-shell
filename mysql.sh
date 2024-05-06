source common.sh

if [ -z "$1"]; then
  echo "Input pass is missing"
  exit 1
fi
# $1 install
# $2 mysql-server
# $3 ExpenseApp@1



HEADING Installing Mysql Server..
dnf $1 $2 -y &>> /tmp/expensemysql.log
STAT $?

HEADING Starting Services..
systemctl enable mysqld &>> /tmp/expensemysql.log
systemctl start mysqld &>> /tmp/expensemysql.log
STAT $?

HEADING secure installation..
mysql_secure_installation --set-root-pass $3 &>> /tmp/expensemysql.log
STAT $?
