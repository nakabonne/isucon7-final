#!/bin/bash
set -e

# pull
cd /root/cco
git pull
echo "$(tput setaf 2)Pull Succeeded! $(tput sgr0)"
echo ""

# reverse proxy reload
sudo cp /root/cco/files/cco.nginx.conf /etc/nginx/sites-available
cd /etc/nginx/sites-enabled
sudo unlink *
sudo ln -s ../sites-available/cco.nginx.conf
sudo /usr/sbin/nginx -t
sudo systemctl restart nginx
echo "$(tput setaf 2)reverse proxy reload Succeeded! $(tput sgr0)"
echo ""

# in-memory cache reload
#sudo cp etc/redis.conf /etc/redis/redis.conf
#sudo systemctl restart redis-server
#echo "$(tput setaf 2)in-memory cache reload Succeeded! $(tput sgr0)"
#echo ""

# log rotate
#make rotate
#make mysqldumpslow
#echo "$(tput setaf 2)log rotate Succeeded! $(tput sgr0)"
#echo ""

# application reload
sudo cp etc/systemd.go.service /etc/systemd/system/cco.golang.service
sudo systemctl daemon-reload
cd ~/cco/webapp/go
make ensure
make
sudo systemctl restart cco.golang.service
echo "$(tput setaf 2)application reload Succeeded! $(tput sgr0)"
echo ""

echo "$(tput setaf 2)############################$(tput sgr0)"
echo "$(tput setaf 2)## Restart Succeeded!!! ✔︎ ##$(tput sgr0)"
echo "$(tput setaf 2)############################$(tput sgr0)"
echo ""
