
## Install with kubectl

```console
kubectl apply -f https://raw.githubusercontent.com/haproxytech/kubernetes-ingress/v1.7/deploy/haproxy-ingress.yaml
```

## Check your installation

```console
kubectl get pods -A
```

```console
kubectl get svc -A
```