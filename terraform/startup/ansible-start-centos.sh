# Update the packet index in the Linux system
#sudo yum -y update

# Set up SSH for ansible:
sudo ssh-keygen -f /root/.ssh/id_rsa -q -N ""
sudo bash -c 'echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDaUDpCHLKWnRWuOuMtmWy5cNi0hCc6FIsHofRv8i3riCNnylbw8vf2aGEPRThb89ZC9c0vhoqIM18ARV6d2D2Ld2H6Pim74kzAODD0wfBZchhqNDM2G388QtS4sqhwn2AuVHwAV20usOFhCn/MSioHAHB+s1MZC02NfpDs7uk+fWFpHsA3TlDCH/CegVofQ1SIGCyYf1iDRYWuALaV6HAQkt8+kHwk54H7zK8awvnpzTlxbg5fv47XWNzfFzT6vK3Ylwx2/buVHdezxvoph3/LyzvKnBcPkx62QD3khIyOt567Ti+4Qyjbhui0SUXDXWocfFIY7OiTr08Zb80updNWdgdek8yUQKEejBeHf5SjViIfOtJ53DrKqBHs6MAnYP7PcwcZgtYecHc6G32zqgBd+IIhcvESDq/938HpxmDU7zStJx2E8cl7QkrJLZ7gJ+vaH4Ss0vYqr2B0ECIFd+Ss3vZTq0XAHXjWq+obVaTUUTWGh13UDpwjzAuPJSKgY00= root@merlin" > /root/.ssh/authorized_keys'
sudo bash -c 'echo "|1|vmLSxEXPKUmm23F6AWmhLHdd1MU=|2SkqURIymfizVOPsGRTzJFNvn8U= ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBN96Au85yywbdyPXyF4cHNF7f3u6Cz1L6aUVp1XiQZMDzELDgJRTfQStr1LVZRGD/fFxhyGoPuVOZmFM2LWQF80=" > /root/.ssh/known_hosts'
sudo sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo service sshd reload