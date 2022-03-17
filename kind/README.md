<h1 align="center">Kind</h1>

## Instalando o `docker` - Ignorar essa etapa caso ja tenha o docker instalado

```console
 sudo curl -L https://get.docker.com/ | bash

 sudo usermod -aG docker $USER
```

## Instalando o `Kind`
```console
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64

chmod +x ./kind

sudo mv ./kind /usr/local/bin/
```
## Instalando o `Kubectl`
```console
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

chmod +x kubectl

sudo mv kubectl /usr/local/bin/
```

## Criando um `cluster`
```console
kind create cluster
```

- Verificando os clusters criados
```console
kind get clusters
```

- Verificando os nodes
```console
kubectl get nodes
```

- Coletando informações do Cluster
```console
kubectl cluster-info

kubectl cluster-info --context kind-meucluster
```

- Deletar o clustr
```console
kind delete cluster
```

## Criando um cluster a partir de um arquivo de configuração `config.yaml`.
```console
kind create cluster --name multinode --config=kind/config.yaml
```