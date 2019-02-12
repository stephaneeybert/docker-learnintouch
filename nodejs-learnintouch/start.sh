#!/bin/bash

export NODE_ENV=development

#. ~/.nvm/nvm.sh node /usr/local/learnintouch/elearning-server.js 2>&1 >> /usr/local/learnintouch/logs/nodejs.log
node /usr/local/learnintouch/engine/api/js/socket/elearning-server.js 2>&1 >> /usr/local/learnintouch/logs/nodejs.log

tail -f /etc/hosts
