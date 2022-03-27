#!bin/bash
echo "you have provide $# vpcs"
for REGION in $@
do
echo "Getting  VPC List for $REGION"
for VPC in $(aws ec2 describe-vpcs --region $REGION |jq ".Vpcs[].VpcId" | tr -d '"')
do
echo "The VPC ID is $VPC"
echo "Getting the subnets from VPC $VPC"
aws ec2 describe-subnets --region $REGION --filters "Name=vpc-id,Values=$VPC" | jq ".Subnets[].SubnetId"
sleep 1
done
done



