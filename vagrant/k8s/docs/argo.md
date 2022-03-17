## Getting Started

- Quick Start
- https://argo-cd.readthedocs.io/en/stable/

```console
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
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