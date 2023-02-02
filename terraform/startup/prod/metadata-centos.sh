#!/bin/bash
sudo ssh-keygen -f /root/.ssh/id_rsa -q -N ""
sudo bash -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCoYK0aiUQuBAFFciDy2m1a0UbNv9MNzgll2+RblL9DIwzZLQPbV6pusSd/JwBXhQBD89lvp+TgOBxwZYllA9q7DqpV+kyAePUFFKYIgEswTwj2z4Hp4ngqm96G5ACBfdmSoJlonjFHrDaW8H9eQLzmHTCKKmWCkCqOsZrNUmLdBtRvhbctPtmqklZI5Y75vfOrOWuSVhiHYRI+09vglhOe7OSxhpkUqti/Cj6xRasedloovbBIX95bfXZQcoq4Q39WiVwsn6yiYKJxlN2tAY61oGe11E3bY5zh/ecVrTzZkg0kr7QmdrjTBpW5Ht2gVAP4AE1cID6x6pnTB7qiK65d4JVoixSJ8gAnby/+hD+O5qB+tid+a+gBldimMyi5Hyd1fbwPFzfjVzyO4fD2yMsdVVv7wh1LxWs0fMd0kCP/NWjK8EbpKpnb5B866zNYwK40Msi4qlIc/FaO9GVG4E5pzcR72CD//oXBZKFk6qT3B+NPiOy5Fb4ixZvrsOsOmYc= root@merlin-prod" > /root/.ssh/authorized_keys'
sudo sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo systemctl reload sshd