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

#curl -fsSL плэйбук hosts config
# hosts --> /etc/ansible/hosts
# config --> /etc/ansible/ansible.cfg

systemctl is-active --quiet nginx && echo Service is running