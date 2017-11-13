#!/bin/bash -x

docker build -t stephaneeybert/redis .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/nodejs-learnintouch localhost:5000/redis
docker push localhost:5000/redis
docker tag stephaneeybert/nodejs-learnintouch thalasoft.com:5000/redis
docker push thalasoft.com:5000/redis
fi
