# install software to manage repositories

sudo apt update
sudo apt upgrade -y
sudo apt install software-properties-common

# add ppa:ansible/ansible to system’s Software Source
sudo apt-add-repository ppa:ansible/ansible -y

# update repos and install ansible
sudo apt update
sudo apt install ansible -y

# install pip, botocore, boto, boto3
sudo apt install python-pip -y
pip install botocore boto boto3

# configure boto
# setup AWS credentials/API keys
mkdir -pv ~/.aws/

echo "
[default]
aws_access_key_id = AKIAJYUFKGBFSFDKDXCQ
aws_secret_access_key = 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"> ~/.aws/credentials

# setup default AWS region
echo "
[default]
region = us-west-2"> ~/.aws/config


# create the “~/hosts” file with the following contents

echo "
[local]
localhost
[webserver]"> ~/hosts