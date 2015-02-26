#!/bin/bash
set -e

if [ ! -a /root/docker-is-ready ]; then
    # Install docker
    curl -sSL https://get.docker.com/ubuntu/ | sh

    # Install docker compose
    curl -L https://github.com/docker/fig/releases/download/1.1.0-rc2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose; chmod +x /usr/local/bin/docker-compose

    # Comfortable access to docker
    sudo usermod -a -G docker vagrant
    echo "cd /vagrant/docker && docker-compose ps" >> /home/vagrant/.bashrc

    touch /root/docker-is-ready
fi

# Start containers
cd /vagrant/docker
docker-compose build
docker-compose up -d
