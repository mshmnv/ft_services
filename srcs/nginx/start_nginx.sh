#!/bin/bash
mkdir -p /run/nginx

# usr/bin/ssh-keygen -A 
# /usr/sbin/sshd
# /usr/sbin/nginx -g 'daemon off;'

# mkdir /run/openrc
# touch /run/openrc/softlevel
# rc-update add sshd

rc default
rc-service sshd start
ssh-keygen -A
rc-service sshd stop