#!/bin/bash

# result_code = 1, Hit, Danger
# result_code = 0, Miss, Safe

check_result=`aws cloudtrail list-trails --query "Trails[*].TrailARN" --output text  | tr '\t' '\n' | wc -l`

result_code=0
result_msg="Cloudtrail Check: You have started the Cloudtrail service."

if [ "$check_result" -eq "0" ];then
  result_code=1
  result_msg="Cloudtrail Check: You have NOT started the Cloudtrail service."
fi
echo $result_code','$result_msg >> /tmp/check_result.log

printf '%s' $result_msg
printf '\n'