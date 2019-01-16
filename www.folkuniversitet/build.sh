#!/bin/bash -x

docker build -t stephaneeybert/www.folkuniversitet --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/www.folkuniversitet localhost:5000/www.folkuniversitet
docker push localhost:5000/www.folkuniversitet
docker tag stephaneeybert/www.folkuniversitet thalasoft.com:5000/www.folkuniversitet
docker push thalasoft.com:5000/www.folkuniversitet
fi
