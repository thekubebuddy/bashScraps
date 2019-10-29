#!/bin/bash

source parameter.config

echo "********** EC2 state change job triggered *************"
#region=ap-south-1
echo "Instance Id: $instance_id "
echo "Instance state: $instance_state"
echo "region: $region"

case $instance_state in
"start")
echo "Starting the instance as per parameter"
# Uncomment the below echo 
echo aws ec2 $instance_state --instance-id $instance_id --region $region
--dry-run

;;
"stop" | "Stop")
echo "stoping the instance as per parameter"
# Uncomment the below echo 
echo aws ec2 $instance_state --instance-id $instance_id --region $region
;;

"terminate" | "Terminate")

echo "Terminating the instance as per parameter"
# Uncomment the below echo 
echo aws ec2 $instance_state --instance-id $instance_id --region $region
--dry-run
;;
*)
echo "unknown state"
;;
esac
echo "************  Job ends  ***************"
