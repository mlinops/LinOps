![ubuntu-linux-minimalizm](https://user-images.githubusercontent.com/101510056/216446129-16372d5f-7ccc-4582-a6a2-9f5f14da616f.jpg)

# LinOps religion

Hey! Lina is back ❤️

The basis for the work of the project are such systems as:

- [Google Cloud Platform](https://cloud.google.com/)
- [Azure DevOps](https://dev.azure.com)
- [Telegram](https://web.telegram.org) (bot🤖)

Technologies used in this project:

* [Terraform](https://www.terraform.io/)
* [Ansible](https://docs.ansible.com/)
* Bash & PHP scripts

💜 Terraform is a tool from Hashicorp that helps you manage infrastructure declaratively. In this case, you do not have to manually create instances, networks, etc. in the console of your cloud provider; it is enough to write a configuration that will outline how you see your future infrastructure.     
🔆Ansible is open source software that automates software delivery, configuration management, and application deployment.     
🐳 Docker is a software for automating the deployment and management of applications in containerized environments, an application containerizer.      

![ksdfghjk](https://user-images.githubusercontent.com/101510056/216449042-c635b9fd-87e8-4ecb-a126-d2d3935dac96.jpg)

# Project stend

![изображение](https://user-images.githubusercontent.com/101510056/216530759-f69a63bd-9755-4781-9044-5e74aa0394f1.png)

![ksdfghjk](https://user-images.githubusercontent.com/101510056/216449042-c635b9fd-87e8-4ecb-a126-d2d3935dac96.jpg)

Pipelines:

![изображение](https://user-images.githubusercontent.com/101510056/216589009-2ef84b71-4fac-4f01-a0d9-26f4043c63de.png)

Release CI/CD pipeline:
![изображение](https://user-images.githubusercontent.com/101510056/216588515-677a3c3c-1c35-48ac-b894-b99eb5e597fb.png)

![ksdfghjk](https://user-images.githubusercontent.com/101510056/216449042-c635b9fd-87e8-4ecb-a126-d2d3935dac96.jpg)

GCP PROD Workspace:

![изображение](https://user-images.githubusercontent.com/101510056/216593517-ca904df7-fd9a-4ac7-a2f8-7a581e1a985d.png)

### A bit of magic with Merlin VMs: 🪄
The good wizard Merlin came to help my project. Yes, yes, it was he who created 3 managing Ansible servers for each workspace. (It's a joke...)

Merlin VMs это - удаленные Ansible-сервера, управляемые Azure DevOps посредствам агента. Для каждого workspace предусмотрен свой "волшебник".

Merlins can:
- manage application configuration and deployment
- slave servers monitoring
- back up databases on slave servers
- send messages to telegram bot

 VMs had the Azure Pipeline Agent installed, therefore can be controlled when performing jobs of CI/CD pipelins.

~ Taking off his hat, he took a deep breath. All tests have been passed. Finally got some tea.

Let's take a closer look at Merlin virtual machines:

![изображение](https://user-images.githubusercontent.com/101510056/216442072-37d90d95-9a19-4133-b700-3db5d773b6b7.png)

As you can see, each Merlin is assigned to his space. Connecting directly to 'dynamic' machines is done by creating an SSH connection.

![ksdfghjk](https://user-images.githubusercontent.com/101510056/216449042-c635b9fd-87e8-4ecb-a126-d2d3935dac96.jpg)

### Merlin VMS in Azure DevOps:
-  Agent Pools

![изображение](https://user-images.githubusercontent.com/101510056/216448142-92dfa0a4-6f6b-49df-8e50-377e25eedd8d.png)

`DEV pool`
![изображение](https://user-images.githubusercontent.com/101510056/216448436-e3294fc4-571f-4aaa-87bd-1d23fd075559.png)

`TEST pool`
![изображение](https://user-images.githubusercontent.com/101510056/216448504-fbefd043-a368-4e0e-b9f6-8a18a46939d5.png)

`PROD pool`
![изображение](https://user-images.githubusercontent.com/101510056/216448615-533bb80c-8b30-4f83-b18f-4d12c9bbad8d.png)

![ksdfghjk](https://user-images.githubusercontent.com/101510056/216449042-c635b9fd-87e8-4ecb-a126-d2d3935dac96.jpg)


### 📫 Telegram notifications

To implement the project, monitoring the implementation of tasks was vital. Therefore, a special 'LinOps' bot was created for the project, which, after passing the CI / CD stages, sends a notification to the group in a telegram. 

![Безымянный](https://user-images.githubusercontent.com/101510056/216535536-6d4a0611-19b1-458a-90b8-47227731a7fc.png)

![ksdfghjk](https://user-images.githubusercontent.com/101510056/216449042-c635b9fd-87e8-4ecb-a126-d2d3935dac96.jpg)

## Monitoring

In order for Telegram to tell us about the availability of virtual machines and about creating a database backup, we need scripts with the creation of a notification.

### 🧐 Monitoring script     
(Cron + Script --> ❗ Telegram notifications)  

```
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
```
### BackUp script
(Cron + Script --> ❗ Telegram notifications)
```
#!/bin/bash

# This script makes a backup copy of the necessary database from a remote host

## Add the task to the CRON [/etc/crontab] ###################################
#                                                                            #   
#          * * * * * root bash /path/to/script > /dev/null 2&>1              #
#                                                                            #         
## In this case, sending 1 package is carried out every minute ###############

now=$(date "+%Y-%m-%d-%S")
filename="$now.sql.gz"
ssh <USER>@<HOST> "mysqldump -u <DB_USER> -p<PASSWORD> <DB_NAME> | gzip -9" > /backup/$filename 
curl 'https://api.telegram.org/bot<TOKEN>/sendMessage?chat_id=<CHAT_ID>&text=Wordpress database backup create'
```
![fff](https://user-images.githubusercontent.com/101510056/216581649-2d8c5d8d-7444-44aa-9716-732ad9f0b631.jpg)

To track the execution of CRON tasks, you can use an interesting service [CRONITOR](https://cronitor.io)

![изображение](https://user-images.githubusercontent.com/101510056/216580811-9a37201b-287a-41cb-b68a-8001a202c385.png)

To install and configure, you need to run the commands:    
Install CronitorCLI:       
```
curl https://cronitor.io/install-linux?sudo=1 -H "API-KEY: 3122de7d6ffb44a49558c53a4b3b4a00"  | sh
```
Run `cronitor discover` to selectively add monitoring to each job in your crontab files:    
```
cronitor discover
```
![ksdfghjk](https://user-images.githubusercontent.com/101510056/216449042-c635b9fd-87e8-4ecb-a126-d2d3935dac96.jpg)

### ✔️ Добавление статьи

To add an article to a Wordpress site, we will use a script that must be placed in the Wordpress root folder:

```
<?php

require_once( dirname(__FILE__) . '/wp-load.php' );
require_once( dirname(__FILE__) . '/wp-admin/includes/admin.php' );

$post_data = array(
    'post_title'    => 'New test post with an additional field',
    'post_content'  => 'Content of the test post with an additional field',
    'post_status'   => 'publish',
    'post_author'   => 1,
    'post_category' => array(1)
);

// Create a post with required fields.
$post_id = wp_insert_post($post_data, true);
print_r($post_id);

?>
```

### A few articles that might help you:  

 📧 [How to make a mail server](https://docs.gitlab.com/ee/administration/reply_by_email_postfix_setup.html)     
 🤖 [How to make notification bot](https://github.com/JackB1ack/telegram-notification)        
 🖥️ [How to launch Ubuntu Desktop on Google Cloud](https://ubuntu.com/blog/launch-ubuntu-desktop-on-google-cloud)     
 
 ![ubuntu-linux-minimalizm](https://user-images.githubusercontent.com/101510056/216446129-16372d5f-7ccc-4582-a6a2-9f5f14da616f.jpg)
