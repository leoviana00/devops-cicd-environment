## Instalar o `Dashboard`

```console
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml
```
<p align="center">
  <img alt="k8s" src="../../data/k8s-images/k8s-admin-5.png">
</p>

- Criar um usuário `Admin Panel`
```console
sudo nano kubernetes-dashboard-service.yaml
```

- Conteúdo do arquivo:

```console
#Criando usuário admin
#Atribui a função de administrador de cluster
#Cria um novo serviço NodePort que publica o TargetPort 8443 como NodePort #30002:

--- 
apiVersion: v1
kind: ServiceAccount
metadata:
  name: admin-user
  namespace: kubernetes-dashboard
--- 
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: admin-user
  namespace: kubernetes-dashboard
---   
kind: Service
apiVersion: v1
metadata:
  namespace: kubernetes-dashboard
  name: kubernetes-dashboard-service-np
  labels:
    k8s-app: kubernetes-dashboard
spec:
  type: NodePort
  ports:
  - port: 8443
    nodePort: 30002
    targetPort: 8443
    protocol: TCP
  selector:
    k8s-app: kubernetes-dashboard
```

- Deployando o usuário:
```console
kubectl apply -f kubernetes-dashboard-service.yaml
```
<p align="center">
  <img alt="k8s" src="../../data/k8s-images/k8s-admin-6.png">
</p>

## `Token` de acesso a Dashboard

```console
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
```

<p align="center">
  <img alt="k8s" src="../../data/k8s-images/k8s-admin-7.png">
</p>

## `Url` de acesso

https://172.16.16.100:30002/#/login

<p align="center">
  <img alt="k8s" src="../../data/k8s-images/k8s-admin-3.png">
</p>

<p align="center">
  <img alt="k8s" src="../../data/k8s-images/k8s-admin-1.png">
</p>

<p align="center">
  <img alt="k8s" src="../../data/k8s-images/k8s-admin-2.png">
</p>