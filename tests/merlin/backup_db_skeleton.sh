#!/bin/bash

# This script makes a backup copy of the necessary database from a remote host

## Add the task to the CRON [/etc/crontab] ###################################
#                                                                            #   
#          * * * * * root bash /path/to/script > /dev/null 2&>1              #
#                                                                            #         
## In this case, sending 1 package is carried out every minute ###############

#! /bin/bash

now=$(date "+%Y-%m-%d-%S")
filename="$now.sql.gz"

ssh <USER>@<HOST> "mysqldump -u <DB_USER> -p<PASSWORD> <DB_NAME> | gzip -9" > /backup/$filename 

curl 'https://api.telegram.org/bot<TOKEN>/sendMessage?chat_id=<CHAT_ID>&text=Wordpress database backup create'


## To restore the database ######################################################################################
#                                                                                                               #            
# scp -r /backup/<BACKUP-FILE> <USER>@<HOST>:/path/to/copy/backup-file                                          #
# ssh <USER>@<HOST> "gunzip /path/to/copy/backup-file"                                                          #                
# ssh <USER>@<HOST> "mysqldump -u <DB_USER> -p<PASSWORD> <DB_NAME> | gzip -9" < /path/to/copy/unzip backup-file #
#                                                                                                               #    
#################################################################################################################