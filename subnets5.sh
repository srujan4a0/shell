if [ $# -gt 0 ]; then
    echo "You have given $# regions to check the VPC List"
    for REGION in $@; do
        if [[ $AWSREGION =~ (^|[[:space:]])"$REGION"($|[[:space:]]) ]]; then
            echo "Getting VPC List For $REGION"
            for VPC in $(aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcId" | tr -d '"'); do
                echo "The VPC ID is $VPC"
                echo "Getting The Subnets From VPC $VPC"
                aws ec2 describe-subnets --region $REGION --filters "Name=vpc-id,Values=$VPC" | jq ".Subnets[].SubnetId"
                echo "------------------------------------------------------"
                sleep 1
            done
        else
            echo "$REGION IS AN INVALID REGION"
            echo "------------------------------------------------------"
        fi
    done

else
    echo "Invalid Input. You have given $# params. Give atlast one region name."
fi

