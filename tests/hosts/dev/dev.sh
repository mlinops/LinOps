timeout 30

if ping -c 1 gcp-server-1-dev &> /dev/null
then
  echo "SUCCESS"
else
  echo "ERROR"
fi

if ping -c 1 gcp-server-2-dev &> /dev/null
then
  echo "SUCCESS"
else
  echo "ERROR"
fi

if ping -c 1 gcp-server-3-dev &> /dev/null
then
  echo "SUCCESS"
else
  echo "ERROR"
fi
