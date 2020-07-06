#!/bin/bash

fileserverip='172.31.31.205'

touch /tmp/run_setup
echo "`date  +%Y-%m-%d_%H:%M:%S` Begin setup" >> /tmp/run_setup
echo " fileserver ip is: $fileserverip ">>/tmp/run_setup
echo "$fileserverip  fileserver" >>/etc/hosts

ec2_priv_ip=`sudo ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1`

echo "$ec2_priv_ip  ${ec2_priv_hostname}" >>/etc/hosts
sudo hostnamectl set-hostname ${ec2_priv_hostname}

echo "`date  +%Y-%m-%d_%H:%M:%S` Install SSM" >> /tmp/run_setup
#sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo yum install -y http://$fileserverip/files/ssm/amazon-ssm-agent.rpm  && echo "`date  +%Y-%m-%d_%H:%M:%S` AmazonSSM installed." >> /tmp/run_setup

echo "`date  +%Y-%m-%d_%H:%M:%S` Disable default repos" >> /tmp/run_setup
sudo mkdir -p /etc/yum.repos.d/disable
sudo mv /etc/yum.repos.d/*.repo /etc/yum.repos.d/disable/

echo "`date  +%Y-%m-%d_%H:%M:%S` Install repos" >> /tmp/run_setup
#curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
#curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
sudo curl -L -o /etc/yum.repos.d/epel.repo http://$fileserverip/files/repos/epel.repo && echo "`date  +%Y-%m-%d_%H:%M:%S` Epel repo installed." >> /tmp/run_setup
sudo curl -L -o /etc/yum.repos.d/AliyunCentOS-Base.repo http://$fileserverip/files/repos/AliyunCentOS-Base.repo && echo "`date  +%Y-%m-%d_%H:%M:%S` CentOS repo installed." >> /tmp/run_setup

echo "`date  +%Y-%m-%d_%H:%M:%S` Install wget " >> /tmp/run_setup
sudo yum install -y wget && echo "`date  +%Y-%m-%d_%H:%M:%S` Wget installed." >> /tmp/run_setup

sudo setenforce 0
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

sudo echo tfdemo | sudo passwd tfuser --stdin



echo "`date  +%Y-%m-%d_%H:%M:%S` End setup " >> /tmp/run_setup
exit 0


