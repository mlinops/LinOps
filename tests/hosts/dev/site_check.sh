header=$(curl -I http://gcp-server-1-dev | head -n 1 | cut -c 10-15)

if [ $header == '200 OK' ]
then 
echo SITE 1 OK
else
echo SITE 1 NOT OK
exit 1
fi
