ansible_version=$(sudo ansible --version | head -n 1 | cut -c 9-13)

etalon_ansible_version=$(echo "2.9.6")

if [ $ansible_version == $etalon_ansible_version ]
then
echo Ansible version OK
else
echo Ansible version NOT OK
exit 1
fi
