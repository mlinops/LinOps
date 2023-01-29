header=$(curl -I http://gcp-server-1-dev | head -n 1 | cut -c 10-13)

if [ $header == '200' ]
then 
echo SITE 1 OK
else
echo SITE 1 NOT OK
exit 1
fi
