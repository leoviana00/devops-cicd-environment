## Iniciar instalação
```console
vagrant up
```

<p align="center">
  <img alt="k8s" src="../../../data/k8s-images/k8s-admin-4.png">
</p>

## Logar no control plane
```console
vagrant ssh k8s-control
```

## Configurar o `Kubectl`
```console
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## Verificação

- Verificando os nodes
```console
kubectl get nodes
```

<p align="center">
  <img alt="nodes" src="../../../data/k8s-images/k8s-admin-8.png">
</p>
