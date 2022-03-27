#!bin/bash
#REGION="us-east-1"
REGION1=$1
REGION2=$2
echo "Getting  VPC List for $REGION1"
for VPC in $(aws ec2 describe-vpcs --region $REGION1 |jq ".Vpcs[].VpcId" | tr -d '"')
do
echo "The VPC ID is $VPC"
echo "Getting the subnets from VPC $VPC"
aws ec2 describe-subnets --region $REGION1 --filters "Name=vpc-id,Values=$VPC" | jq ".Subnets[].SubnetId"
sleep 1
done

echo "Getting  VPC List for $REGION2"
for VPC in $(aws ec2 describe-vpcs --region $REGION2 |jq ".Vpcs[].VpcId" | tr -d '"')
do
echo "The VPC ID is $VPC"
echo "Getting the subnets from VPC $VPC"
aws ec2 describe-subnets --region $REGION2 --filters "Name=vpc-id,Values=$VPC" | jq ".Subnets[].SubnetId"
sleep 1
done


