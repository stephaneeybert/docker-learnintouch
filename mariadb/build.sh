#!/bin/bash -x

docker build -t stephaneeybert/mariadb:10.1.24 .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/mariadb:10.1.24 localhost:5000/mariadb:10.1.24
docker push localhost:5000/mariadb:10.1.24
docker tag stephaneeybert/mariadb:10.1.24 thalasoft.com:5000/mariadb:10.1.24
docker push thalasoft.com:5000/mariadb:10.1.24
fi
