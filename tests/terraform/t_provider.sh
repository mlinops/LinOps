terraform_version_command=$(terraform version)
provider=$(echo $terraform_version_command | head -n  1 | cut -c 76-81)
etalon_provider=$(echo "google")

if [ $provider ==  $etalon_provider ]
then
echo Terraform provider OK
else
echo Terraform provider NOT OK
exit 1
fi