Make sure to have the entry:
folkuniversitet.thalasoft.com in the virtual host

Open the website
http://folkuniversitet.thalasoft.com
http://folkuniversitet.thalasoft.com/admin.php

View the www.learnintouch/README.md file

Installing the website
docker stack deploy --compose-file docker-compose-dev.yml folkuniversitet
docker stack rm folkuniversitet
