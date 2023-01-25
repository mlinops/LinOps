# Update the packet index in the Linux system
#sudo yum -y update

# Installation of the necessary packages
sudo yum -y install ansible

# Set up SSH for ansible:
sudo ssh-keygen -f /root/.ssh/id_rsa -q -N ""
sudo bash -c 'cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys'
sudo sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo service sshd reload

# Pull the ansible config
curl -fsSL https://raw.githubusercontent.com/linaduko/LinOps/develop/develop/ansible/service/ansible.cfg -o /tmp/ansible.cfg
sudo mv /tmp/ansible.cfg /etc/ansible/ansible.cfg

# Pull the file hosts for ansible
curl -fsSL https://raw.githubusercontent.com/linaduko/LinOps/develop/develop/ansible/service/hosts -o /tmp/hosts
sudo mv /tmp/hosts /etc/ansible/hosts 

# Pull the playbook-file for ansible
curl -fsSL https://raw.githubusercontent.com/linaduko/LinOps/develop/develop/ansible/playbook-main.yml -o /tmp/playbook-main.yml
sudo ansible-playbook /tmp/playbook-main.yml