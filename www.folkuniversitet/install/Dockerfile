FROM stephaneeybert/learnintouch

COPY vhost.conf /tmp
RUN cat /tmp/vhost.conf >> /usr/local/apache/conf/extra/httpd-vhosts.conf && rm -f /tmp/vhost.conf

RUN mkdir -p /usr/local/learnintouch/www/folkuniversitet/account
WORKDIR /usr/local/learnintouch/www/folkuniversitet
RUN ln -s /usr/local/learnintouch/engine/admin.php admin.php \
  && ln -s /usr/local/learnintouch/engine engine \
  && ln -s /usr/local/learnintouch/engine/index.php index.php \
  && ln -s /usr/local/learnintouch/engine/cron/cleanup.sh cleanup.sh \
  && ln -s /usr/local/learnintouch/engine/cron/backup.sh backup.sh \
  && ln -s /usr/local/learnintouch/engine/cron/refresh_template_models.sh refresh_template_models.sh

COPY htaccess /usr/local/learnintouch/www/folkuniversitet/.htaccess
RUN mkdir /usr/local/learnintouch/www/folkuniversitet/account/setup
COPY specific.php /usr/local/learnintouch/www/folkuniversitet/account/setup

RUN chown -R apache:apache /usr/local/learnintouch/ \
  && chmod -R 755 /usr/local/learnintouch/

COPY db-database.sql /usr/local/learnintouch/www/folkuniversitet/
COPY db-structure.sql /usr/local/learnintouch/www/folkuniversitet/
COPY db-data.sql /usr/local/learnintouch/www/folkuniversitet/

COPY website-db-seed.sh /usr/local/learnintouch/www/folkuniversitet/

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/local/learnintouch/www/folkuniversitet/website-db-seed.sh"]

# Build the container: docker build -t stephaneeybert/www.folkuniversitet .
# Rename the image: docker tag stephaneeybert/www.folkuniversitet thalasoft.com:5000/www.folkuniversitet
# Push the image: docker push thalasoft.com:5000/www.folkuniversitet
# Run the container: docker run -d --name www.folkuniversitet -p 81:80 -p 444:443 --link mysql:mysql stephaneeybert/www.folkuniversitet
# Open a shell in the container: docker exec -it www.folkuniversitet bash
# tail -400f /usr/local/learnintouch/php_error_log
# tail -400f /usr/local/apache/logs/error_log
