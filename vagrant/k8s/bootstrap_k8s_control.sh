#!/bin/bash

echo "PASSO 01 - INICIALIZAR O KUBERNETES"
kubeadm init --apiserver-advertise-address=172.16.16.100 --pod-network-cidr=192.168.0.0/16 >> /root/kubeinit.log 2>/dev/null

echo "PASSO 02 - INSTALAR O CALICO"
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://docs.projectcalico.org/v3.18/manifests/calico.yaml >/dev/null 2>&1

echo "PASSO 03 - GERAR O COMANDO DE JOIN DOS NODES"
kubeadm token create --print-join-command > /joincluster.sh 2>/dev/null

echo "PASSO 04 - CONFIGURAR O KUBECTL "
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config