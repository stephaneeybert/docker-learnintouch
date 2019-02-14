#!/bin/bash -x

docker build -t stephaneeybert/www.folkuniversitet-install --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.folkuniversitet-install localhost:5000/www.folkuniversitet-install
docker push localhost:5000/www.folkuniversitet-install
docker tag stephaneeybert/www.folkuniversitet-install thalasoft.com:5000/www.folkuniversitet-install
docker push thalasoft.com:5000/www.folkuniversitet-install
fi
