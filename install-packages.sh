#/bin/bash

set -e

# from http://www.unixmen.com/tmux-a-terminal-multiplexer/
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
yum clean all

yum groupinstall -y "Development Tools"
yum install -y tmux git vim ruby ruby-devel rubygems

