#/bin/bash

set -e

echo "Adding epel repository"
# from http://www.unixmen.com/tmux-a-terminal-multiplexer/
rpm -i http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
yum clean all

echo "Installing development tools"
yum groupinstall -y -q "Development Tools"
echo "Installing additional RPMs"
yum install -y -q tmux vim ruby ruby-devel rubygems openssl-devel zlib-devel curl-devel expat-devel readline-devel zlib-devel libyaml-devel libffi-devel zlib1g

