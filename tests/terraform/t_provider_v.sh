terraform_version_command=$(terraform version)
provider_version=$(echo $terraform_version_command | head -n  1| cut -c 84-89)
etalon_provider_version=$(echo "4.50.0")

if [ $provider_version == $etalon_provider_version ]
then
echo Terraform provider version OK
else
echo Terraform provider version NOT OK
exit 1
fi
