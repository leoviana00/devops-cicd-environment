#!/bin/bash

echo "PASSO 01 - STATUS DOS SERVIÇOS"

export KUBECONFIG=/etc/kubernetes/admin.conf

echo "DOCKER"
systemctl status docker | grep "Active:"
echo "K8S"
systemctl status kubelet | grep "Active:"

echo "PASSO 02 - INFORMAÇÕES DO CLUSTER"
kubectl cluster-info

echo "PASSO 03 - LISTAR TUDO"
kubectl get all --all-namespaces

echo "PASSO 04 - LISTAR NODES K8S..."
kubectl get nodes

echo "PASSO 05 - LISTAR TODOS OS NAMESPACES PADRÃO"
kubectl get ns