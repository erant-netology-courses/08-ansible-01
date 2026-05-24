#!/bin/bash

# Поднятие контейнеров
sudo docker run -d --name centos7 pycontribs/centos:7 sleep infinity
sudo docker run -d --name ubuntu pycontribs/ubuntu sleep infinity
sudo docker run -d --name fedora pycontribs/fedora sleep infinity

# Запуск playbook
ansible-playbook -i playbook/inventory/prod.yml playbook/site.yml --ask-vault-pass

# Остановка и удаление контейнеров
docker rm -f centos7 ubuntu fedora