dnf install nginx -y

systemctl enable nginx
systemctl start nginx

rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/expense-frontend-v2.zip

unzip /tmp/frontend.zip

cd /usr/share/nginx/html
# Copy file step pending
systemctl restart nginx