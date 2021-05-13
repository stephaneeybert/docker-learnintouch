#!/bin/bash -x

docker build -t stephaneeybert/learnintouch-cron --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/learnintouch-cron localhost:5000/learnintouch-cron
docker push localhost:5000/learnintouch-cron
docker tag stephaneeybert/learnintouch-cron thalasoft.com:5000/learnintouch-cron
docker tag stephaneeybert/learnintouch-cron europasprak.com:5000/learnintouch-cron
#docker push thalasoft.com:5000/learnintouch-cron
docker push europasprak.com:5000/learnintouch-cron
fi
