#!/bin/bash

# update system package repo
sudo yum update -y

# install apache httpd
sudo yum install -y httpd

# start apache service
sudo systemctl start httpd

# enable httpd
sudo systemctl enable httpd

# custom html file
cat <<EOF >/var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Document</title>
</head>
<body>
  <h1>MY APACHE SERVER</h1>
</body>
</html>
EOF

# restart apache server
sudo systemctl restart httpd
