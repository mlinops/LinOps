#!/bin/bash

# This script checks the availability of host after deploying

sleep 30

ping test-gcp-server-1 -w3
EXIT_STATUS=$?
if [ $EXIT_STATUS -eq 124 ]
then
echo 'Process Timed Out!'
else
echo 'Process did not timeout. Something else went wrong.'
fi
exit $EXIT_STATUS

ping test-gcp-server-2 -w3
EXIT_STATUS=$?
if [ $EXIT_STATUS -eq 124 ]
then
echo 'Process Timed Out!'
else
echo 'Process did not timeout. Something else went wrong.'
fi
exit $EXIT_STATUS

ping test-gcp-server-3 -w3
EXIT_STATUS=$?
if [ $EXIT_STATUS -eq 124 ]
then
echo 'Process Timed Out!'
else
echo 'Process did not timeout. Something else went wrong.'
fi
exit $EXIT_STATUS
