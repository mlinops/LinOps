![ubuntu-linux-minimalizm](https://user-images.githubusercontent.com/101510056/216446129-16372d5f-7ccc-4582-a6a2-9f5f14da616f.jpg)

# LinOps religion

Hey! Lina is back ❤️

The basis for the work of the project are such systems as:

- Google Cloud Platform
- Azure DevOps
- Telegram (да, здесь есть bot 🤖)

Technologies used in this project:

* Terraform
* Ansible
* Bash & PHP scripts

  Terraform is a tool from Hashicorp that helps you manage infrastructure declaratively. In this case, you do not have to manually create instances, networks, etc. in the console of your cloud provider; it is enough to write a configuration that will outline how you see your future infrastructure.
  Ansible is open source software that automates software delivery, configuration management, and application deployment.
  Docker is a software for automating the deployment and management of applications in containerized environments, an application containerizer.

![ubuntu-linux-minimalizm](https://user-images.githubusercontent.com/101510056/216446129-16372d5f-7ccc-4582-a6a2-9f5f14da616f.jpg)

# Project stend

![изображение](https://user-images.githubusercontent.com/101510056/216433789-2ea10c4f-a1c9-485a-ba05-4597f2a234b8.png)

![ubuntu-linux-minimalizm](https://user-images.githubusercontent.com/101510056/216446129-16372d5f-7ccc-4582-a6a2-9f5f14da616f.jpg)

### A bit of magic with Merlin VMs: 🪄
The good wizard Merlin came to help my project. Yes, yes, it was he who created 3 managing Ansible servers for each workspace. (It's a joke...)
In order for me to manage these virtual servers during the CI / CD pipeline, Merlin VMs were created. They had the Azure Pipeline Agent installed.

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




### Telegram notifications

To implement the project, monitoring the implementation of tasks was vital. Therefore, a special 'LinOps' bot was created for the project, which, after passing the CI / CD stages, sends a notification to the group in a telegram.




---
Как сделать почтовый сервер
Как сделать бота для уведомлений Azure DevOps
