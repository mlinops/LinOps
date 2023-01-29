header=$(curl -I http://gcp-server-1-dev | head -n 1 | cut -c 10-18)

if [ $header == '200 OK' ]
then 
echo SITE 1 OK
elif [ $header == '302 Found' ]
then 
echo SITE 1 FOUND
else
echo SITE 1 NOT OK
exit 1
fi
