#! /bin/bash

URL=$1
echo "URL=" $URL

Status_Code=$(curl --write-out "%{http_code}" $URL --output output.txt --silent )

if [ $Status_Code -eq 200 ]
then
  echo " URL is working.Status Code=$Status_Code "
else
  echo " URL is not working.Status Code=$Status_Code"
fi     
 
