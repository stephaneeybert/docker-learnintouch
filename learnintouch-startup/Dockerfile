FROM stephaneeybert/www.folkuniversitet

RUN apt-get install -y iputils-ping telnet

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/bin/apache/bin/apachectl", "start", "-D FOREGROUND"]

# Build the container: docker build -t stephaneeybert/learnintouch-startup .
# Rename the image: docker tag stephaneeybert/learnintouch-startup thalasoft.com:5000/learnintouch-startup
# Push the image: docker push thalasoft.com:5000/learnintouch-startup
# Run the container: docker run -d --name learnintouch-startup -p 80:80 -p 443:443 --link mariadb:mariadb stephaneeybert/learnintouch-startup
# Open a shell in the container: docker exec -it learnintouch-startup bash
# tail -400f /usr/bin/learnintouch/php_error_log
# tail -400f /usr/bin/apache/logs/error_log
# Connect to MySQL: /usr/bin/mysql/install/bin/mysql -h mysql -P 3306 --protocol=tcp -u learnintouch -p

