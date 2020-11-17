#!/bin/bash

# starting the SSH deamon and nginx
/usr/sbin/sshd
nginx -g 'daemon off;'
