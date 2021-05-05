#!/bin/bash -x

docker build -t stephaneeybert/www.learnintouch --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.learnintouch localhost:5000/www.learnintouch
docker push localhost:5000/www.learnintouch
docker tag stephaneeybert/www.learnintouch thalasoft.com:5000/www.learnintouch
#docker push thalasoft.com:5000/www.learnintouch
fi
