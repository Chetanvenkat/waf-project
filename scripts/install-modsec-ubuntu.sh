#!/usr/bin/env bash
set -e
echo "Update packages"
sudo apt update && sudo apt upgrade -y

echo "Install dependencies"
sudo apt install -y git build-essential automake libtool libpcre3-dev libyajl-dev libxml2-dev libcurl4-openssl-dev zlib1g-dev

echo "Install nginx"
sudo apt install -y nginx

echo "Install ModSecurity v3 (engine)"
cd /tmp
git clone --depth 1 https://github.com/SpiderLabs/ModSecurity
cd ModSecurity
git submodule init
git submodule update
./build.sh
./configure
make
sudo make install

echo "Install ModSecurity-nginx connector sources"
cd /tmp
git clone --depth 1 https://github.com/SpiderLabs/ModSecurity-nginx.git

echo "Build nginx dynamic module for modsecurity (requires nginx source or packaging)"
# NOTE: Building the nginx connector module varies by distro. Consult README for ModSecurity-nginx.
echo "Manual steps may be required to compile or install libnginx-mod-security for your distribution."

echo "Install OWASP CRS (example)"
sudo apt install -y modsecurity-crs || {
    echo "If modsecurity-crs package not available, clone https://github.com/coreruleset/coreruleset"
}

echo "Done. Please complete manual steps as needed. See README for full instructions."
