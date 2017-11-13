#!/bin/bash

export NODE_ENV=development

#. ~/.nvm/nvm.sh node /usr/bin/learnintouch/elearning-server.js 2>&1 >> /usr/bin/learnintouch/logs/nodejs.log
node /usr/bin/learnintouch/engine/api/js/socket/elearning-server.js 2>&1 >> /usr/bin/learnintouch/logs/nodejs.log

tail -f /etc/hosts
