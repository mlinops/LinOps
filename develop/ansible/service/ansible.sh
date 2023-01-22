# Update the packet index in the Linux system
sudo apt update

# Installation of the necessary packages
sudo apt-get -y install ansible makepasswd curl

# Set up SSH for ansible:
sudo ssh-keygen -f /root/.ssh/ansible -q -N ""
sudo bash -c 'cat /root/.ssh/ansible.pub > /root/.ssh/authorized_keys'
sudo sed -i 's/PermitRootLogin prohibit_password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo sed -i '/PermitRootLogin yes/s/^#//g' /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart

# Pull the ansible config
curl -fsSL https://raw.githubusercontent.com/linaduko/LinOps/develop/develop/ansible/service/ansible.cfg -o /tmp/ansible.cfg
sudo mv /tmp/ansible.cfg /etc/ansible/ansible.cfg

# Pull the file hosts for ansible
curl -fsSL https://raw.githubusercontent.com/linaduko/LinOps/develop/develop/ansible/service/hosts -o /tmp/hosts
sudo mv /tmp/hosts /etc/ansible/hosts 

# Pull the playbook-file for ansible
https://raw.githubusercontent.com/linaduko/LinOps/develop/develop/ansible/playbook-main.yml -o /tmp/playbook-main.yml
sudo ansible-playbook /tmp/playbook-main.yml

systemctl is-active --quiet nginx && echo Service is running > test.txt