wget https://raw.githubusercontent.com/JPapple/2018_Group11/master/go.sh?token=AoEefgyzowahieh-gSVdskiddmQ0mXHgks5bfhO5wA%3D%3D

sudo bash ./go.sh?token=AoEefgyzowahieh-gSVdskiddmQ0mXHgks5bfhO5wA%3D%3D

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
aws_access_key_id = AKIAJDDPRI62IX6A4UAQ
aws_secret_access_key = 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"> ~/.aws/credentials

sudo chmod 666 ~/.aws/credentials
# setup default AWS region
echo "
[default]
region = us-west-2"> ~/.aws/config

sudo chmod 666 ~/.aws/config

echo "
[local]
localhost
[webserver]"> ~/hosts
sudo chmod 666 ~/hosts







