#!/bin/bash

# This script checks the availability of host

### Add the task to the CRON [/etc/crontab] ##############################
#                                                                        #   
#        * * * * * root bash /path/to/script > /dev/null 2&>1            #
#                                                                        #        
## In this case, sending 1 package is carried out every minute ###########

ping -t <HOST>

if [ $? -eq 0]; then
curl 'https://api.telegram.org/bot<TOKEN>/sendMessage?chat_id=<CHAT_ID>&text=WARNINNG! Server status NOT OK -- <HOST>'
else
echo OK >> /dev/null
fi

