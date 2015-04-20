#!/bin/bash
set -e

docker_compose_path=/usr/local/bin/docker-compose
if [ ! -f "$docker_compose_path" ]; then
    # Install docker
    curl -sSL https://get.docker.com/ubuntu/ | sh

    # Install docker compose
    curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` > "$docker_compose_path"
    chmod +x "$docker_compose_path"

    # Comfortable access to docker
    sudo usermod -a -G docker vagrant
    echo "cd /vagrant && docker-compose ps" >> /home/vagrant/.bashrc
fi

# Start containers
cd /vagrant
docker-compose build
docker-compose up -d
