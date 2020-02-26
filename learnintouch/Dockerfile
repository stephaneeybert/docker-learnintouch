FROM stephaneeybert/php:7.3.9


# Install some locales
RUN apt-get update \
  && apt-get install -y locales \
  && locale-gen en_GB \
  && locale-gen fr_FR \
  && locale-gen sv_SE \
  && locale-gen nn_NO \
  && localedef -i en_GB -f UTF-8 en_GB.UTF-8 \
  && localedef -i fr_FR -f UTF-8 fr_FR.UTF-8 \
  && localedef -i sv_SE -f UTF-8 sv_SE.UTF-8 \
  && localedef -i nn_NO -f UTF-8 nn_NO.UTF-8

# The backup module uses the wget command to do an asynchronous database backup
RUN apt-get update \
  && apt-get install -y wget

COPY httpd.conf /usr/local/apache/conf
COPY httpd-ssl.conf /usr/local/apache/conf/extra
COPY php.ini /usr/local/php

RUN mkdir -p /usr/local/learnintouch/tmp \
  && chmod 755 /usr/local/learnintouch/tmp

WORKDIR /usr/local/learnintouch

# Use the non embedded development version for now instead
#COPY engine.zip /usr/local/learnintouch
#RUN unzip /usr/local/learnintouch/engine.zip \
#  && rm -f /usr/local/learnintouch/engine.zip

RUN mkdir /usr/local/learnintouch/logs \
  && chmod 755 /usr/local/learnintouch/logs \
  && touch /usr/local/learnintouch/logs/php_error_log \
  && chmod 755 /usr/local/learnintouch/logs/php_error_log

RUN groupadd -f apache && useradd -d /usr/local/learnintouch/ -g apache apache

COPY expand-secrets.sh /usr/local/learnintouch/

COPY db_engine-db.sql /usr/local/learnintouch/
COPY db_engine-structure.sql /usr/local/learnintouch/
COPY db_engine-data.sql /usr/local/learnintouch/

COPY engine-db-seed.sh /usr/local/learnintouch/
COPY start.sh /usr/local/learnintouch/

RUN chown -R apache:apache /usr/local/learnintouch/ \
  && chmod -R 755 /usr/local/learnintouch/

COPY httpd-vhosts.conf /usr/local/apache/conf/extra

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/local/learnintouch/engine-db-seed.sh"]

# Build the container: docker build -t stephaneeybert/learnintouch .
# Rename the image: docker tag stephaneeybert/learnintouch thalasoft.com:5000/learnintouch
# Push the image: docker push thalasoft.com:5000/learnintouch
# Run the container: docker run --link mariadb:mariadb --name learnintouch stephaneeybert/learnintouch
# Open a shell in the container: docker exec -it learnintouch bash
# Create a docker volume for the data: docker volume create --name learnintouch-engine
# View the php log: tail -400f /usr/local/learnintouch/logs/php_error_log
# View the apache learnintouch access log: tail -400f /usr/local/apache/logs/learnintouch-access_log
