#!/bin/bash
echo "I am trying to get all the server info ....!!!!"
#declaring varaibles  for security group,public ip,publich hostname
#sL is to make the output look better
SG=$(curl -sL http://169.254.169.254/latest/meta-data/security-groups)
PHOSTNAME=$(curl -sL http://169.254.169.254/latest/meta-data/public-hostname)
PIP=$(curl -sL http://169.254.169.254/latest/meta-data/public-ipv4)
#printing security groups ,hostname,publicip
echo $SG
echo ${PHOSTNAME}
echo "${PIP}"



