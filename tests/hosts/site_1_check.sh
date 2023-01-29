header=$(curl -I http://gcp-server-1-dev | head -n 1 | cut -c 10-12)

if [ $header == '200' ]
then 
echo SERVER 1 OK
else
echo SERVER 1 NOT OK
exit 1
fi