#!/bin/bash

# Поднятие контейнеров
docker run -d --name centos7 pycontribs/centos:7 sleep infinity
docker run -d --name ubuntu pycontribs/ubuntu sleep infinity
docker run -d --name fedora pycontribs/fedora sleep infinity

# Запуск playbook
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

# Остановка и удаление контейнеров
docker rm -f centos7 ubuntu fedora