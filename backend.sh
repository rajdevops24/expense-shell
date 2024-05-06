source common.sh
HEADING "Disable nodejs def ver"
dnf module disable nodejs -y
STAT $?
HEADING "Enable nodejs 20"
dnf module enable nodejs:20 -y
STAT $?

HEADING "Install nodejs "
dnf install nodejs -y
STAT $?

HEADING "Add exp user"
id expense
if [ $? -ne 0 ]; then
  useradd expense
fi
STAT $?

HEADING "setup backend service"
cp backend.service /etc/systemd/system/backend.service
STAT $?
HEADING "delete existing app dir"
rm -rf /app
STAT $?

HEADING "create app dir"
mkdir /app
STAT $?

HEADING "download backend code"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
cd /app
unzip /tmp/backend.zip
STAT $?

HEADING "install npm"
npm install
STAT $?

HEADING "install mysql client"
dnf install mysql -y
STAT $?
HEADING "testing access to mysql"
mysql -h 172.31.25.196 -uroot -pExpenseApp@1 < /app/schema/backend.sql
STAT $?
HEADING "start backend services"
systemctl daemon-reload
systemctl enable backend
systemctl restart backend
STAT $?