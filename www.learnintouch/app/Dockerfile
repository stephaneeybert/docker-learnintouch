FROM stephaneeybert/www.learnintouch-install

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/local/learnintouch/start.sh"]

# Build the container: docker build -t stephaneeybert/www.learnintouch .
# Rename the image: docker tag stephaneeybert/www.learnintouch thalasoft.com:5000/www.learnintouch
# Push the image: docker push thalasoft.com:5000/www.learnintouch
# Run the container: docker run -d --name www.learnintouch -p 80:80 -p 443:443 --link mariadb:mariadb stephaneeybert/www.learnintouch

# Open a shell in the container: docker exec -it www.learnintouch bash
# tail -400f /usr/local/learnintouch/php_error_log
# tail -400f /usr/local/apache/logs/error_log
# Connect to MySQL: /usr/local/mariadb/install/bin/mysql -h mysql -P 3306 --protocol=tcp -u learnintouch -p

# On the droplet

# Viewing the logs
# cd ~/dev/docker/projects/common/volumes/logs
# tail -400f mariadb.error.log 

# Opening a mysql client
# docker exec -it learnintouch_mysql.1.uc4gosi409o7809w2wbaptnfs bash
# install/bin/mysql -h mysql -P 3306 --protocol=tcp -u learnintouch -p
# docker exec -it learnintouch_www.learnintouch.1.6o726ejzt9t9unrd47dlio21x bash
# /usr/local/mariadb/install/bin/mysql -h mysql -P 3306 --protocol=tcp -u learnintouch -p

# Checking the Apache configuration
# docker exec -it learnintouch_www.learnintouch.1.6o726ejzt9t9unrd47dlio21x bash
# /usr/local/apache/bin/apachectl configtest
# /usr/local/apache/bin/apachectl -S

# Listing the listening ports
# netstat -an | grep "LISTEN "
# nmap -A -T4 thalasoft.com

