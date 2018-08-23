# Group11 Moodle

#### Overview
    Taks1:

    Install moodle on Ubuntu16.04 via shell script.

    Task2:
    
    Use ansible to create a new instance, and connect to the new instance to install moodle.

## Requirements
Apache, MySQL, PHP, ansible

## What to prepare
    Your access_key_id 
    Your secret_access_key
    The region of your AWS server
[How to find the access key?](https://docs.google.com/document/d/1HvtM-0Ll5rlWbB16nG8YKT6pmg9YCWGRyUYaCbA7QMA/edit?usp=sharing)


## Task1
Install moodle on Ubuntu16.04 via shell script.

#### Brief steps to complete the installation of moodle
>1. Create an ubuntu server manually
>
>2. Open putty or terminal and download the shell script [go.sh](/go.sh) on github
>
>3. Run the shell script by `sudo bash ./fileName`
>
>4. Open the browser and enter `yourPublicIP/moodle`          
>

#### Links for the details guide
[The guide to access the script on Github](https://docs.google.com/document/d/1r0rBu91coZcT9evDckhVMgBM_cAlRPtOOpd_DK4gZVg/edit?usp=sharing)<br /> 
[How to connect EC2 in MAC](https://docs.google.com/document/d/1sksqeDPXzgBtqOh0_qjytU9YM5C-jsg9X905gfR1Ejc/edit?usp=sharing)


## Task2
Use ansible to create a new instance, and connect to the new instance to install moodle.

#### Steps to complete task2
>1. Download the shell script [ansible.sh](/ansible.sh) and run it by `bash ./ansible.sh`
>
>2. Enter your access key while you can see `Please enter your access key` on your terminal.
>
>3. Enter your secret access key while you can see `Please enter your secret access key` on your terminal.
>
>4. After run the shell script, download [moodle.yml](/moodle.yml)
>
>5. Run the moodle.yml by `ansible-playbook moodle.yml`
>
>6. Oen the browser and enter `yourPublicIP/moodle`, The IP address can be found on the output of ansible playbook.

#### Links for the details guide
[how to install ansible and create instance using ansible](https://docs.google.com/document/d/1zHs-bkvNFI_yvIac9VeXDQqdaL-PZcCvinST8wmBaXo/edit?usp=sharing)
[Group11_HowToGuide_Assignment1](https://docs.google.com/document/d/11K0AEiaFOtQwvX-307g0dadRy3-mCDM_wGGnOYtfwCQ/edit?usp=sharing)
