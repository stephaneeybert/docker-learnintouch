FROM stephaneeybert/php:5.6.20

RUN apt-get install -y unzip \
  && apt-get install -y --no-install-recommends apt-utils \
  && apt-get install -y locales \
  && locale-gen en_GB \
  && locale-gen fr_FR \
  && locale-gen sv_SE \
  && locale-gen nn_NO \
  && localedef -i en_GB -f UTF-8 en_GB.UTF-8 \
  && localedef -i fr_FR -f UTF-8 fr_FR.UTF-8 \
  && localedef -i sv_SE -f UTF-8 sv_SE.UTF-8 \
  && localedef -i nn_NO -f UTF-8 nn_NO.UTF-8

COPY httpd.conf /usr/bin/apache/conf
COPY php.ini /usr/bin/php

RUN mkdir -p /usr/bin/learnintouch/tmp \
  && chmod 755 /usr/bin/learnintouch/tmp

# Use the non embedded development version for now instead
#COPY engine.zip /usr/bin/learnintouch
#WORKDIR /usr/bin/learnintouch
#RUN unzip /usr/bin/learnintouch/engine.zip \
#  && rm -f /usr/bin/learnintouch/engine.zip

RUN mkdir /usr/bin/learnintouch/logs \
  && chmod 755 /usr/bin/learnintouch/logs \
  && touch /usr/bin/learnintouch/logs/php_error_log \
  && chmod 755 /usr/bin/learnintouch/logs/php_error_log

RUN groupadd -f apache && useradd -d /usr/bin/learnintouch/ -g apache apache

COPY db_engine-db.sql /usr/bin/learnintouch/
COPY db_engine-structure.sql /usr/bin/learnintouch/
COPY db_engine.sql /usr/bin/learnintouch/

COPY engine-db-seed.sh /usr/bin/learnintouch/

RUN chown -R apache:apache /usr/bin/learnintouch/ \
  && chmod -R 755 /usr/bin/learnintouch/

COPY httpd-vhosts.conf /usr/bin/apache/conf/extra

ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
#ENTRYPOINT ["/bin/bash", "/usr/bin/learnintouch/engine-db-seed.sh"]

# Build the container: docker build -t stephaneeybert/learnintouch .
# Rename the image: docker tag stephaneeybert/learnintouch thalasoft.com:5000/learnintouch
# Push the image: docker push thalasoft.com:5000/learnintouch
# Run the container: docker run --link mariadb:mariadb --name learnintouch stephaneeybert/learnintouch
# Open a shell in the container: docker exec -it learnintouch bash
# Create a docker volume for the data: docker volume create --name learnintouch-engine
# View the php log: tail -400f /usr/bin/learnintouch/logs/php_error_log
