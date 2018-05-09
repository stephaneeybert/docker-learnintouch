Make sure to have the entry:
thalasoft.com in the virtual host

Open the website
http://www.thalasoft.com
http://www.thalasoft.com/admin.php

View the www.learnintouch/README.md file

Installing the website
docker stack deploy --compose-file docker-compose-dev.yml wwwthalasoft
docker stack rm wwwthalasoft
