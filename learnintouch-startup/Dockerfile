FROM stephaneeybert/www.folkuniversitet

RUN apt-get install -y iputils-ping telnet

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/bin/learnintouch/start.sh"]

# Build the container: docker build -t stephaneeybert/learnintouch-startup .
# Rename the image: docker tag stephaneeybert/learnintouch-startup thalasoft.com:5000/learnintouch-startup
# Push the image: docker push thalasoft.com:5000/learnintouch-startup
# Run the container: docker run -d --name learnintouch-startup -p 80:80 -p 443:443 --link mariadb:mariadb stephaneeybert/learnintouch-startup

# Open a shell in the container: docker exec -it learnintouch-startup bash
# tail -400f /usr/bin/learnintouch/php_error_log
# tail -400f /usr/bin/apache/logs/error_log
# Connect to MySQL: /usr/bin/mariadb/install/bin/mysql -h mysql -P 3306 --protocol=tcp -u learnintouch -p

# On the droplet

# Viewing the logs
# cd ~/dev/docker/projects/learnintouch/volumes/logs
# tail -400f mariadb.error.log 

# Opening a mysql client
# docker exec -it learnintouch_mysql.1.uc4gosi409o7809w2wbaptnfs bash
# install/bin/mysql -h mysql -P 3306 --protocol=tcp -u learnintouch -p
# docker exec -it learnintouch_learnintouch-startup.1.6o726ejzt9t9unrd47dlio21x bash
# /usr/bin/mariadb/install/bin/mysql -h mysql -P 3306 --protocol=tcp -u learnintouch -p

# Checking the Apache configuration
# docker exec -it learnintouch_learnintouch-startup.1.6o726ejzt9t9unrd47dlio21x bash
# /usr/bin/apache/bin/apachectl configtest
# /usr/bin/apache/bin/apachectl -S

# Listing the listening ports
# netstat -an | grep "LISTEN "
# nmap -A -T4 thalasoft.com

