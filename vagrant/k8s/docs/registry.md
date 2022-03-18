<h1 align="center">Registry Privado</h1>

## Criando `sercret` para o `Registry Privado` no namespace `java`

```console
kubectl create secret docker-registry registrypull --docker-server=192.168.10.30:5000 --docker-username=leoviana --docker-password=changeit --docker-email=test@dock.mail -n java
````