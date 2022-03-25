#!/bin/bash

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

# echo "PASSO 05 - INSTALAR O CONTAINERD"
# apt update -qq >/dev/null 2>&1
# apt install -qq -y containerd apt-transport-https >/dev/null 2>&1
# mkdir /etc/containerd
# containerd config default > /etc/containerd/config.toml
# systemctl restart containerd
# systemctl enable containerd >/dev/null 2>&1

echo "PASSO 05 - INSTALAÇÃO DOCKER"
apt update -qq >/dev/null 2>&1
apt-get -qq -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common >/dev/null 2>&1
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - >/dev/null 2>&1
if [ $? -ne 0 ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - >/dev/null 2>&1
fi
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" >/dev/null 2>&1
apt update -qq >/dev/null 2>&1
apt-get install -y docker-ce docker-ce-cli containerd.io >/dev/null 2>&1
usermod -aG docker $USER
chmod 777 /var/run/docker.sock
# Add vagrant to docker group
usermod -aG docker vagrant
cat >>/etc/docker/daemon.json<<EOF
{
  "insecure-registries" : ["192.168.10.30:5000","192.168.10.30:5001"]
}
EOF
systemctl daemon-reload
systemctl restart docker

echo "PASSO 06 - ADICIONAR O REPOSITÓRIO DO KUBERNETES"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - >/dev/null 2>&1
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main" >/dev/null 2>&1

echo "PASSO 07 - INSTALAR O KUBEADM, KUBELET E KUBECTL"
apt install -qq -y kubeadm=1.21.7-00 kubelet=1.21.7-00 kubectl=1.21.7-00 >/dev/null 2>&1

echo "PASSO 09 - HABILITAR A AUTENTICAÇÃO COM SSH"
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd

echo "PASSO 10 - DEFINIR A SENHA DO ROOT"
echo -e "pulse\npulse" | passwd root >/dev/null 2>&1
echo "export TERM=xterm" >> /etc/bash.bashrc

echo "PASSO 11 - ALTERAR O ARQUIVO /etc/hosts"
cat >>/etc/hosts<<EOF
172.16.16.100   k8s-control.labs.com.br     k8s-control
172.16.16.101   k8s-node1.labs.com.br       k8s-node1
172.16.16.102   k8s-node2.labs.com.br       k8s-node2
EOF