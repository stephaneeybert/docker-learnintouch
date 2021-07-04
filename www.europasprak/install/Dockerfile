FROM stephaneeybert/learnintouch

# www.europasprak.com
COPY vhost.conf /tmp
RUN cat /tmp/vhost.conf >> /usr/local/apache/conf/extra/httpd-vhosts.conf && rm -f /tmp/vhost.conf
RUN mkdir -p /usr/local/learnintouch/www/europasprak.com/account/setup
COPY phpinfo.php /usr/local/learnintouch/www/europasprak.com/
COPY website-db-seed.sh /usr/local/learnintouch/www/europasprak.com/
COPY db-database.sql /usr/local/learnintouch/www/europasprak.com/
COPY db-structure.sql /usr/local/learnintouch/www/europasprak.com/
COPY htaccess /usr/local/learnintouch/www/europasprak.com/.htaccess
COPY specific.php /usr/local/learnintouch/www/europasprak.com/account/setup/

RUN ln -s /usr/local/learnintouch/engine/admin.php /usr/local/learnintouch/www/europasprak.com/admin.php \
  && ln -s /usr/local/learnintouch/engine /usr/local/learnintouch/www/europasprak.com/engine \
  && ln -s /usr/local/learnintouch/engine/index.php /usr/local/learnintouch/www/europasprak.com/index.php \
  && ln -s /usr/local/learnintouch/engine/cron/cleanup.sh /usr/local/learnintouch/www/europasprak.com/cleanup.sh \
  && ln -s /usr/local/learnintouch/engine/cron/backup.sh /usr/local/learnintouch/www/europasprak.com/backup.sh \
  && ln -s /usr/local/learnintouch/engine/cron/refresh_template_models.sh /usr/local/learnintouch/www/europasprak.com/refresh_template_models.sh

# fhs.europasprak.com
COPY vhost.conf.fhs /tmp
RUN cat /tmp/vhost.conf.fhs >> /usr/local/apache/conf/extra/httpd-vhosts.conf && rm -f /tmp/vhost.conf.fhs
RUN mkdir -p /usr/local/learnintouch/www/fhs.europasprak.com/account/setup
COPY htaccess.fhs /usr/local/learnintouch/www/fhs.europasprak.com/.htaccess
COPY specific.php.fhs /usr/local/learnintouch/www/fhs.europasprak.com/account/setup/specific.php

RUN ln -s /usr/local/learnintouch/engine/admin.php /usr/local/learnintouch/www/fhs.europasprak.com/admin.php \
  && ln -s /usr/local/learnintouch/engine /usr/local/learnintouch/www/fhs.europasprak.com/engine \
  && ln -s /usr/local/learnintouch/engine/index.php /usr/local/learnintouch/www/fhs.europasprak.com/index.php \
  && ln -s /usr/local/learnintouch/engine/cron/cleanup.sh /usr/local/learnintouch/www/fhs.europasprak.com/cleanup.sh \
  && ln -s /usr/local/learnintouch/engine/cron/backup.sh /usr/local/learnintouch/www/fhs.europasprak.com/backup.sh \
  && ln -s /usr/local/learnintouch/engine/cron/refresh_template_models.sh /usr/local/learnintouch/www/fhs.europasprak.com/refresh_template_models.sh

RUN chown -R apache:apache /usr/local/learnintouch/ \
  && chmod -R 755 /usr/local/learnintouch/

WORKDIR /usr/local/learnintouch/www/europasprak.com

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/local/learnintouch/www/europasprak.com/website-db-seed.sh"]

# Build the container: docker build -t stephaneeybert/www.europasprak .
# Rename the image: docker tag stephaneeybert/www.europasprak europasprak.com:5000/www.europasprak
# Push the image: docker push europasprak.com:5000/www.europasprak
# Run the container: docker run -d --name www.europasprak -p 81:80 -p 444:443 --link mysql:mysql stephaneeybert/www.europasprak
# Open a shell in the container: docker exec -it www.europasprak bash
# tail -400f /usr/local/learnintouch/php_error_log
# tail -400f /usr/local/apache/logs/error_log
