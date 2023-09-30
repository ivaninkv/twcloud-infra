#!/bin/bash

set -e

# Проверяем наличие ключевой пары
if [ ! -f ~/.ssh/id_ed25519 ]; then
  # Создаем SSH-ключ Ed25519
  ssh-keygen -t ed25519 -C "local" -f ~/.ssh/id_ed25519 -N ""
fi
# Добавляем публичный ключ в authorized_keys
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys

# Инициализируем Docker и portainer
docker swarm init
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
