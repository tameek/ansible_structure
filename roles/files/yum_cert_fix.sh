#!
/bin/bash
#Fixes issue where yum throws a bunch of cert errors when running Ansible Yum module
yum check-update ca-certificates; (($?==100)) && yum -y  update ca-certificates || yum -y reinstall ca-certificates && rpm -Vv ca-certificates | awk '$1!="........." && $2!="d" {system("mv -v " $NF " /root/cert.bak")}' && update-ca-trust extract
