<h1 align="center">Instalação e configuração do argocd</h1>

<p align="center">
  <img alt="argo" src="../../../data/argocd-images/argo-logo.png">
</p>

## Utilizando linha de comando

1. Quick Start
- https://argo-cd.readthedocs.io/en/stable/

```console
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

2. Port-Foward
- Isso criará um encaminhamento da aplicação que executa no cluster Kubernetes na porta 443/TCP para a porta 8080/TCP do host local. Dessa forma, você pode abrir um navegador no endereço: https://localhost:8080. Se você fechar o terminal ou der CRTL+C, o port-forward será encerrado e você perderá o acesso.

```console
kubectl -n argocd port-forward svc/argocd-server -n argocd 8080:443
```

3. Login
- O login padrão é admin e uma senha aleatória será gerada. Para obtê-la, execute o seguinte comando em outro terminal:
```console
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

- Após fazer o login no Argo CD, altere a senha no seguinte endereço: https://localhost:8080/user-info?changePassword=true
- Após mudar a senha na interface web, você pode remover a secret argocd-initial-admin-secret, que contém a senha inicial com o seguinte comando:
```console
kubectl -n argocd delete secret argocd-initial-admin-secret
```

## Utilizando a interface do `LENS`

1. Quick Start
- https://argo-cd.readthedocs.io/en/stable/

```console
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

2. Selecione o `namespace` do argocd, selecione `service` e vá em `argocd-server`

<p align="center">
  <img alt="argo" src="../../../data/argocd-images/argocd-admin-1.png">
</p>

3. Faça um `Port-Foward` clicando aqui:

<p align="center">
  <img alt="argo" src="../../../data/argocd-images/argocd-admin-2.png">
</p>

4. Seremos redirecionados para tela inicial do `argocd`

<p align="center">
  <img alt="argo" src="../../../data/argocd-images/argocd-admin-3.png">
</p>

5. Precisamos do `password`, para isso vamos seguir os passos da imagem abaixo e copiar a senha.

<p align="center">
  <img alt="argo" src="../../../data/argocd-images/argocd-admin-4.png">
</p>

6. Voltando a tela de login do `argocd`, vamos entrar com o usuário `admin` e o password que copiamos no passo anterior.



## Resource Tracking 
- https://argo-cd.readthedocs.io/en/stable/user-guide/resource_tracking/

- Choosing a tracking method

```console
apiVersion: v1
data:
  application.resourceTrackingMethod: annotation
kind: ConfigMap
```

```console
kubectl edit cm argocd-cm -n argocd
```