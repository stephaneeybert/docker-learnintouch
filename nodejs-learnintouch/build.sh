#!/bin/bash -x

docker build -t stephaneeybert/nodejs-learnintouch --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/nodejs-learnintouch localhost:5000/nodejs-learnintouch
docker push localhost:5000/nodejs-learnintouch
docker tag stephaneeybert/nodejs-learnintouch europasprak.com:5000/nodejs-learnintouch
docker push europasprak.com:5000/nodejs-learnintouch
fi
