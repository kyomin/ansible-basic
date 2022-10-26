#! /usr/bin/env bash

# ssh key 생성
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.219.11  # node01
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.219.12  # node02
