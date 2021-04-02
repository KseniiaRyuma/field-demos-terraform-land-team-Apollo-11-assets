#!/bin/bash -

#TFC Organization
echo
echo "Please enter your Terraform Cloud organization name."
read TFC_ORGANIZATION
echo
echo "Running Terraform Login to get TFC credential."
echo
terraform login
echo
echo "Please confirm the below is correct:"
echo
echo "TFC Organization : $TFC_ORGANIZATION"
echo "TFC Credential : $(cat ~/.terraform.d/credentials.tfrc.json)"
echo
read -p "Do these look right to you? Y/n " -n 1 -r
echo
if [[ ! \$REPLY =~ ^[Yy]\$ ]]
then
  echo "Please try again...Rerun ~/scripts/tfc.sh"
  exit 1
fi
export TFC_ORGANIZATION=$TFC_ORGANIZATION
export TF_VAR_ORGANIZATION=$TFC_ORGANIZATION
echo export TFC_ORGANIZATION=$TFC_ORGANIZATION >> ~/.bashrc
echo export TF_VAR_TFC_ORGANIZATION=$TFC_ORGANIZATION >> ~/.bashrc
echo export TERRAFORM_CONFIG=/root/.terraform.d/credentials.tfrc.json >> ~/.bashrc