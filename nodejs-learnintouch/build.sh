#!/bin/bash -x

docker build -t stephaneeybert/nodejs-learnintouch .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/nodejs-learnintouch localhost:5000/nodejs-learnintouch
docker push localhost:5000/nodejs-learnintouch
docker tag stephaneeybert/nodejs-learnintouch thalasoft.com:5000/nodejs-learnintouch
docker push thalasoft.com:5000/nodejs-learnintouch
fi
