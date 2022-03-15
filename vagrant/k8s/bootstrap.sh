#!/bin/bash

## !IMPORTANT ##
#
## This script is tested only in the generic/ubuntu2004 Vagrant box
## If you use a different version of Ubuntu or a different Ubuntu Vagrant box test this again
#

echo "PASSO 01 - DESABILITAR O USO DE SWAP"
sed -i '/swap/d' /etc/fstab
swapoff -a

echo "PASSO 02 - DESATIVAR O FIREWALL"
systemctl disable --now ufw >/dev/null 2>&1

echo "PASSO 03 - HABILITAR OS MODULOS DO KERNEL"
cat >>/etc/modules-load.d/containerd.conf<<EOF
overlay
br_netfilter
EOF
modprobe overlay
modprobe br_netfilter

echo "PASSO 04 - CONFIGURAR OS MODULOS DO KERNEL"
cat >>/etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
EOF
sysctl --system >/dev/null 2>&1

echo "PASSO 05 - INSTALAR O CONTAINERD"
apt update -qq >/dev/null 2>&1
apt install -qq -y containerd apt-transport-https >/dev/null 2>&1
mkdir /etc/containerd
containerd config default > /etc/containerd/config.toml
systemctl restart containerd
systemctl enable containerd >/dev/null 2>&1

echo "PASSO 06 - ADICIONAR O REPOSITÓRIO DO KUBERNETES"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - >/dev/null 2>&1
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main" >/dev/null 2>&1

echo "PASSO 07 - INSTALAR O KUBEADM, KUBELET E KUBECTL"
apt install -qq -y kubeadm=1.21.7-00 kubelet=1.21.7-00 kubectl=1.21.7-00 >/dev/null 2>&1

echo "PASSO 08 - HABILITAR A AUTENTICAÇÃO COM SSH"
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd

echo "PASSO 08 - DEFINIR A SENHA DO ROOT"
echo -e "kubeadmin\nkubeadmin" | passwd root >/dev/null 2>&1
echo "export TERM=xterm" >> /etc/bash.bashrc

echo "PASSO 08 - ALTERAR O ARQUIVO /etc/hosts"
cat >>/etc/hosts<<EOF
172.16.16.100   k8s-control.labs.com.br     k8s-control
172.16.16.101   k8s-node1.labs.com.br       k8s-node1
172.16.16.102   k8s-node2.labs.com.br       k8s-node1
EOF