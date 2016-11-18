#!/bin/sh

set -e

sudo apt-get install -y awscli git make
sudo chown ubuntu /mnt/
touch .prep
