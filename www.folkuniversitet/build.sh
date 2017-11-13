#!/bin/bash -x

docker build -t stephaneeybert/www.folkuniversitet .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/learnintouch.com localhost:5000/www.folkuniversitet
docker push localhost:5000/www.folkuniversitet
docker tag stephaneeybert/learnintouch.com thalasoft.com:5000/www.folkuniversitet
docker push thalasoft.com:5000/www.folkuniversitet
fi
