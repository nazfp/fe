#!/bin/bash



# NOTE:
# There is no support for environment variables. 
# Functional on EC2, Ubuntu 22



app_name=vms
repo_dst="$HOME/repo/${app_name}"
commit_hash=$1
echo "commit hash ${commit_hash}"

if [ "$(which git)" == "" ]; then
	echo "Fatal: git not found" && exit 1;
fi

echo "End of Deployment Script"
exit 0;