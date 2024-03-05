#!/bin/bash -e

# 00-prerequisites.md

echo
echo -e "\033[1mPreparing the prerequisites\033[0m"
echo -e "\033[1m===========================\033[0m"

echo
echo -e "\033[1mUpdating the package repos\033[0m"
echo -e "\033[1m==========================\033[0m"
sudo dnf -yv update
sudo dnf install -y openssl

echo
echo -e "\033[1mInstalling python package system\033[0m"
echo -e "\033[1m================================\033[0m"
sudo dnf install -v --assumeyes python3-pip

echo
echo -e "\033[1mThe pip version is:\033[0m"
echo -e "\033[1m===================\033[0m"
pip3 --version


echo
echo -e "\033[1mInstalling podman\033[0m"
echo -e "\033[1m=================\033[0m"
sudo dnf -y install podman


echo
echo -e "\033[1mInstalling podman-compose\033[0m"
echo -e "\033[1m=========================\033[0m"
# sudo dnf install podman-compose
pip3 install podman-compose

podman-compose --version

echo
echo -e "\033[1mAllowing 443, 4443 and 80 ports and HTTPS,HTTPS protocols\033[0m"
echo -e "\033[1m=========================================================\033[0m"

sudo firewall-cmd --add-port={443/tcp,4443/tcp,80/tcp}
sudo firewall-cmd --add-service={https,http}
sudo firewall-cmd --runtime-to-permanent

echo
echo -e "\033[1mPorts and Services Allowed\033[0m"
echo -e "\033[1m===========================\033[0m"

sudo firewall-cmd --list-all | grep -iE "https|http|443|4443|80"

