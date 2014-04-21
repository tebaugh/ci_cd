#!/usr/bin/env bash

#common function to output an error message and exit
function check_error {
   # Expects $1 to be 0 or 1
   # Expects $2 to be string
   if [ $1 -ne 0 ]; then
      echo $2
      exit 1
   fi
   return 0
}
# This is looking for a file on the VM.  If found the VM is already provisioned
if [ -f "/var/vagrant_provision" ]; then
  exit 0
fi

echo "Installing wget ....."
yum install -y wget >/dev/null 2>&1
check_error $? "Unable to install wget"

echo "Installing man...."
yum install -y man >/dev/null 2>&1
check_error $? "Unable to install man"

echo "Adding EPEL repo ...."
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm >/dev/null 2>&1
check_error $? "unable to wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm >/dev/null 2>&1
check_error $? "Unable to wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm"
rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm >/dev/null 2>&1
check_error $? "Unable to rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm"

echo "Installing development tools....."
yum groupinstall -y development >/dev/null 2>&1
check_error $? "Unable to install development tools...."

echo "Installing libyaml-devel ...."
yum install -y libyaml-devel >/dev/null 2>&1
check_error $? "Unable to install libyaml-devel...."

echo "Installing ruby  ....."
yum install -y ruby >/dev/null 2>&1
check_error $? "Unable to install ruby ..."

echo "Installing chef client ...."
curl -L https://www.opscode.com/chef/install.sh | sudo bash >/dev/null 2>&1
check_error $? "Unable to install chef...."

echo "cleaning up ...."
if [ -f "/home/vagrant/epel-release-6-8.noarch.rpm" ]; then
  rm /home/vagrant/epel-release-6-8.noarch.rpm >/dev/null 2>&1
  check_error $? "Unable to remove /home/vagrant/epel-release-6-8.noarch.rpm ...."
fi

if [ -f "/home/vagrant/remi-release-6.rpm" ]; then 
  rm /home/vagrant/remi-release-6.rpm >/dev/null 2>&1
  check_error $? "Unable to remove /home/vagrant/remi-release-6.rpm ...."
fi
