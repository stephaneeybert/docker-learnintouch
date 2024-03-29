#!/bin/bash -x

docker build -t stephaneeybert/learnintouch --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/learnintouch localhost:5000/learnintouch
docker push localhost:5000/learnintouch
docker tag stephaneeybert/learnintouch europasprak.com:5000/learnintouch
docker push europasprak.com:5000/learnintouch
fi
