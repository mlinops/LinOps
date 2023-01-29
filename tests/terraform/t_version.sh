terraform_version_command=$(terraform version)
terver=$(echo $terraform_version_command | head -n  1 | cut -c 12-16)
provider=$(echo $terraform_version_command | head -n  1| cut -c 76-81)
provider_version=$(echo $terraform_version_command | head -n  1 | cut -c 84-89)
etalon_version=$(echo "1.3.7")
etalon_provider=$(echo "google")
etalon_provider_version=$(echo "4.50.0")

if [ $terver == $etalon_version ]
then
echo Terraform version OK
else
echo Terraform version NOT OK
exit 1
fi

if [ $provider == $etalon_provider ]
then
echo Terraform provider OK
else
echo Terraform provider NOT OK
exit 1
fi

if [ $provider_version == $etalon_provider_version ]
then
echo Terraform provider version OK
else
echo Terraform provider version NOT OK
exit 1
fi


