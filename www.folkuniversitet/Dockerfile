FROM stephaneeybert/www.thalasoft

COPY vhost.conf /tmp
RUN cat /tmp/vhost.conf >> /usr/bin/apache/conf/extra/httpd-vhosts.conf && rm -f /tmp/vhost.conf

RUN mkdir -p /usr/bin/learnintouch/www/folkuniversitet/account
WORKDIR /usr/bin/learnintouch/www/folkuniversitet
RUN ln -s /usr/bin/learnintouch/engine/admin.php admin.php \
  && ln -s /usr/bin/learnintouch/engine engine \
  && ln -s /usr/bin/learnintouch/engine/index.php index.php \
  && ln -s /usr/bin/learnintouch/engine/cron/cleanup.sh cleanup.sh \
  && ln -s /usr/bin/learnintouch/engine/cron/backup.sh backup.sh \
  && ln -s /usr/bin/learnintouch/engine/cron/refresh_template_models.sh refresh_template_models.sh

COPY htaccess /usr/bin/learnintouch/www/folkuniversitet/.htaccess
RUN mkdir /usr/bin/learnintouch/www/folkuniversitet/account/setup
COPY specific.php /usr/bin/learnintouch/www/folkuniversitet/account/setup

RUN chown -R apache:apache /usr/bin/learnintouch/ \
  && chmod -R 755 /usr/bin/learnintouch/

COPY db-database.sql /usr/bin/learnintouch/www/folkuniversitet/
COPY db-structure.sql /usr/bin/learnintouch/www/folkuniversitet/
COPY db-data.sql /usr/bin/learnintouch/www/folkuniversitet/

COPY website-db-seed.sh /usr/bin/learnintouch/www/folkuniversitet/

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/bin/learnintouch/www/folkuniversitet/website-db-seed.sh"]

# Build the container: docker build -t stephaneeybert/www.folkuniversitet .
# Rename the image: docker tag stephaneeybert/www.folkuniversitet thalasoft.com:5000/www.folkuniversitet
# Push the image: docker push thalasoft.com:5000/www.folkuniversitet
# Run the container: docker run -d --name www.folkuniversitet -p 81:80 -p 444:443 --link mysql:mysql stephaneeybert/www.folkuniversitet
# Open a shell in the container: docker exec -it www.folkuniversitet bash
# tail -400f /usr/bin/learnintouch/php_error_log
# tail -400f /usr/bin/apache/logs/error_log
