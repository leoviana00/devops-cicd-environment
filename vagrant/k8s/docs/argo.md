## Getting Started

- 1. Quick Start
- https://argo-cd.readthedocs.io/en/stable/

```console
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

- 2. Port-Foward
- Isso criará um encaminhamento da aplicação que executa no cluster Kubernetes na porta 443/TCP para a porta 8080/TCP do host local. Dessa forma, você pode abrir um navegador no endereço: https://localhost:8080. Se você fechar o terminal ou der CRTL+C, o port-forward será encerrado e você perderá o acesso.

```console
kubectl -n argocd port-forward svc/argocd-server -n argocd 8080:443
```

- 3. Login
- O login padrão é admin e uma senha aleatória será gerada. Para obtê-la, execute o seguinte comando em outro terminal:
```console
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

- Após fazer o login no Argo CD, altere a senha no seguinte endereço: https://localhost:8080/user-info?changePassword=true
- Após mudar a senha na interface web, você pode remover a secret argocd-initial-admin-secret, que contém a senha inicial com o seguinte comando:
```console
kubectl -n argocd delete secret argocd-initial-admin-secret
```

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