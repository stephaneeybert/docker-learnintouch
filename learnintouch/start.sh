#!/bin/bash

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
export LEARNINTOUCH_DB_PASSWORD={{DOCKER-SECRET:LEARNINTOUCH_DB_PASSWORD}}
export WWW_LEARNINTOUCH_DB_PASSWORD={{DOCKER-SECRET:WWW_LEARNINTOUCH_DB_PASSWORD}}
export WWW_FOLKUNIVERSITET_DB_PASSWORD={{DOCKER-SECRET:WWW_FOLKUNIVERSITET_DB_PASSWORD}}
export WWW_THALASOFT_DB_PASSWORD={{DOCKER-SECRET:WWW_THALASOFT_DB_PASSWORD}}
source /usr/bin/learnintouch/expand-secrets.sh

# Avoid having to provide the user password on the command line
export MYSQL_PWD=$DB_ROOT_PASSWORD

# Start the HTTP server
/usr/bin/apache/bin/apachectl start && tail -f /dev/null

