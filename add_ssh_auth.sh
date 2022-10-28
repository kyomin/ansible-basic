#! /usr/bin/env bash

# ssh key 생성
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.219.11  # node01
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.219.12  # node02
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.219.13  # node03
sshpass -p vagrant ssh -T -o StrictHostKeyChecking=no vagrant@192.168.219.14  # node04
