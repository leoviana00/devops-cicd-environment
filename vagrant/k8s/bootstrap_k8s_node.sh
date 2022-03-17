#!/bin/bash

echo "PASSO 01 - EXECUTAR O COMANDO JOIN NO NODE"
apt install -qq -y sshpass >/dev/null 2>&1
sshpass -p "pulse" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no k8s-control.labs.com.br:/joincluster.sh /joincluster.sh 2>/dev/null
bash /joincluster.sh >/dev/null 2>&1