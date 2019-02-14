#!/bin/bash -x

docker build -t stephaneeybert/www.thalasoft-install --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.thalasoft-install localhost:5000/www.thalasoft-install
docker push localhost:5000/www.thalasoft-install
docker tag stephaneeybert/www.thalasoft-install thalasoft.com:5000/www.thalasoft-install
docker push thalasoft.com:5000/www.thalasoft-install
fi
