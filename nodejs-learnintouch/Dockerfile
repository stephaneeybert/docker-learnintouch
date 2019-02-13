FROM stephaneeybert/nodejs

RUN mkdir -p /usr/local/learnintouch/

WORKDIR /usr/local/learnintouch/

RUN npm install formidable http https path fs connect cookie socket.io redis socket.io-redis lodash

COPY start.sh /usr/local/learnintouch/
RUN chmod 755 /usr/local/learnintouch/*

#ENTRYPOINT ["/usr/bin/tail", "-f", "/dev/null"]
ENTRYPOINT ["/bin/bash", "/usr/local/learnintouch/start.sh", "-D FOREGROUND"]

# Build the container: docker build -t stephaneeybert/nodejs-learnintouch .
# Rename the image: docker tag stephaneeybert/nodejs-learnintouch thalasoft.com:5000/nodejs-learnintouch
# Push the image: docker push thalasoft.com:5000/nodejs-learnintouch
# Run the container: docker run -d -p 9001:9001 -v /home/stephane/dev/php/projects/learnintouch/engine:/usr/local/learnintouch/engine --link redis:redis  --name nodejs-learnintouch stephaneeybert/nodejs-learnintouch
# Check that the port is open: nmap -p 9001 localhost
# Open a shell in the container: docker exec -it nodejs-learnintouch bash

