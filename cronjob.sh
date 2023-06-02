#! /bin/bash
# generate URL.sh script
#touch /home/aqsa286/Desktop/URL.sh

script=/home/aqsa286/Desktop/URL.sh         #name of the script

(
cat << 'EOF'
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

EOF
) > $script

if [[ -x $script ]]
  then
      chmod +x $script 
   elif [[ -f $script ]]
   then  
      "*/15 * * * * $script"
  else
    echo "Problem in creating file: \"$script\""
fi
