#!/bin/bash -x

docker build -t stephaneeybert/learnintouch-startup .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/learnintouch-startup localhost:5000/learnintouch-startup
docker push localhost:5000/learnintouch-startup
docker tag stephaneeybert/learnintouch-startup thalasoft.com:5000/learnintouch-startup
docker push thalasoft.com:5000/learnintouch-startup
fi
