#!/bin/bash

# This script checks the availability of Wordpress site after deploying (header check)

header=$(curl -I http://gcp-server-1-prod | head -n 1 | cut -c 10-13)

if [ $header == '200' ]
then 
echo SITE 1 OK
else
echo SITE 1 NOT OK
exit 1
fi

header=$(curl -I http://gcp-server-2-prod:8080 | head -n 1 | cut -c 10-13)

if [ $header == '200' ]
then 
echo SITE 1 OK
else
echo SITE 1 NOT OK
exit 1
fi