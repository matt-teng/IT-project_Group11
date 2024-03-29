#!/bin/bash
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

sudo apt install awscli -y

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
aws ec2 import-key-pair --public-key-material "$(cat ~/.ssh/id_rsa.pub | tr -d '\n')"  --key-name main-instance

echo "
[defaults]
host_key_checking = False
"> ~/ansible.cfg

# wget https://raw.githubusercontent.com/matt-teng/IT-project_Group11/master/wp_group11.pem?token=AV4FZTFJWVzlYGxknS6j5edU1XYGhDzTks5bf-ltwA%3D%3D -O wp_group11.pem
# sudo chmod 777 wp_group11.pem
# cp -i wp_group11.pem ~/.ssh/
# sudo chmod 400 ~/.ssh/wp_group11.pem
# create a new key pair
# sudo bash -c "aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > ~/.ssh/MyKeyPair.pem"
# sudo chmod 400 ~/.ssh/MyKeyPair.pem

# eval $(ssh-agent -s)
# eval `ssh-agent bash`
# ssh-add ~/.ssh/MyKeyPair.pem
# export ANSIBLE_HOST_KEY_CHECKING=False
