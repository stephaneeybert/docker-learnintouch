FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -y libncurses-dev \
  && apt-get install -y libz-dev \
  && apt-get install -y build-essential \
  && apt-get install -y cmake

COPY mariadb-10.1.24.tar.gz /usr/bin/
WORKDIR /usr/bin/
RUN gzip -d mariadb-10.1.24.tar.gz \
  && tar -xvf mariadb-10.1.24.tar \
  && ln -s mariadb-10.1.24 mariadb

WORKDIR /usr/bin/mariadb/
RUN mkdir install && mkdir install/data && mkdir install/var && mkdir install/etc && mkdir install/tmp

RUN cd /usr/bin/mariadb/ \
  && cmake \
  -DCMAKE_INSTALL_PREFIX=/usr/bin/mariadb/install \
  -DWITH_INNOBASE_STORAGE_ENGINE=1 \
  -DMYSQL_DATADIR=/usr/bin/mariadb/install/data \
  -DDOWNLOAD_BOOST=1 \
  -DWITH_BOOST=/usr/bin/mariadb/install/boost \
  -DMYSQL_UNIX_ADDR=/usr/bin/mariadb/install/tmp/mariadb.sock \
  && make \
  && make install \
  && make clean

COPY startup.sh install/startup.sh

COPY my.cnf install/my.cnf
RUN ln -s /usr/bin/mariadb/install/my.cnf ~/.my.cnf

COPY db-health-check.sh /usr/bin/learnintouch/
RUN chmod 755 /usr/bin/learnintouch/db-health-check.sh

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "install/startup.sh"]

# Build the container: docker build -t stephaneeybert/mariadb:10.1.24 .
# Rename the image: docker tag stephaneeybert/mariadb:10.1.24 thalasoft.com:5000/mariadb:10.1.24
# Push the image: docker push thalasoft.com:5000/mariadb:10.1.24
# Run the container (The data volume allows for data persistence after a container deletion): docker run -d -p 3307:3306 -v /home/stephane/dev/php/learnintouch/docker/volumes/database/data:/usr/bin/mariadb/install/data --name mariadb stephaneeybert/mariadb:10.1.24
# Check that the host port is open: nmap -p 3307 localhost
# Open a shell in the container: docker exec -it mariadb bash
# Open a mariadb client: /usr/bin/mariadb/install/bin/mysql -u root -p
# View the mariadb log: tail -400f /usr/bin/mariadb/install/logs/mariadb.error.log
# Connect from the host: cd programs/install/mariadb/; bin/mysql -h localhost -P 3307 --protocol=tcp -u root -p
# Stop the container: docker stop mariadb
# Delete the container: docker rm mariadb
