#!/bin/bash
sudo apt install -y subversion python3 aptitude
sudo ssh-keygen -f /root/.ssh/id_rsa -q -N ""
sudo bash -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDF7P0nbOD8WhtPSguSksRdSdKnNsb/v9PwqlISFCZbeCAs7fxOrJzLzHcRtkqDn3inn8uUZWGvUlnhdNenwGteMpBU0v7k599OpDRBtSx5UQgVPP773cgirJxsYJFLZWmkRn+HuwiI6f6aoZEWzlIJ6B9DD6karNKQtq4QP1i1tRTAbkiqEkGuvWsTb9FRM4pyXWiTx6Doo9HLbl2TvDvedAlGHCdNeK1Uh7CF1+1GKynceB60vtEnNimLKV4VGIuvrmFmlPy1PvYCJHTGImmUTt+sz5qQNAkBCebmyUAlWQGs4Tq7AgW5X7er/emu/7s1MPrioAmSWfHXGLr5wUI/Q6hQakcYRAc3EnickTPn8iFyf6epGnBWXYBPoL3m0YaxHs9yGbwKN1aQBxBc5016t8+oRV5tlfWxom8xYI+JPhLVxTQoGgS5BuW2eo+0rpc39cMwNSqJSpqqkPf1SIUPdiWDLw2aolwtNsBwSOOgDXRBn1hOv4tgi7PC2lyj11c= root@merlin-test" > /root/.ssh/authorized_keys'
sudo sed -i '/PermitRootLogin prohibit-password/s/^#//g' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart