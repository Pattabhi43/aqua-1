#! /bin/bash

ANSIBLE_LOCALHOST_WARNING=False \
ANSIBLE_INVENTORY_UNPARSED_WARNING=False \
ansible-playbook docker-create.yaml
