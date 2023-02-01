#!/bin/bash
sudo ssh-keygen -f /root/.ssh/id_rsa -q -N ""
sudo bash -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD6iGJoWG5n/9tk/wCL+GjmVpB0W99vijdpDC+nLN5v70QkJCAL9NVZ5CYF+EALixYXgklI5cjWbhEHTVwWQJ8lm4HuaorToO8mpoiPEfQp41MNWM0Bc0O3T6B4+lcLV3Hxt6N9PBb+ywiK4hIXNOKQDaHI8J3kAw3LnYQrgtvNOx4em7v00TbG8cHSQmj0QuI4UxgDdIWWGxMlXn2dsysoQtienM+hb0VTZGmQFfx+vrx1w0zhPqmpKHeBvI9bI91Uamy2zTywnSmtkOb2nkdjdMZv/cpTIlhaAf/IGTNp7cLFqmNj9DZSNdHgP6jcBrizkfc2aXM7RdB53G+vzazg24rmi7bhtJTOqui3+U+DQLKuvca6QPprlzrruzvsGUhEPvo81g2VB6Zx4WiShzKaCIBlomXHju75O7h2ekQpip2Urt5n7u7BaadKnLucgjBhLFk7538u03KVaVc76BKA4jVujK/dICrBOMsKkFjkB2wWDTuAvX/U+hfp5RsC3lc= root@merlin-dev" > /root/.ssh/authorized_keys'
sudo sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo systemctl reload sshd