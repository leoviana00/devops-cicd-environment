## Docker Compose STack `CICD`

1. Iniciando o `jenkins` e o `sonar`.
docker-compose up -d

2. Pegar o `initial admin password` jenkins
docker exec jenkins-cicd cat /var/jenkins_home/secrets/initialAdminPassword

3. Confirmar se os containers estão `running`
docker ps

4. Pegar o `initial admin password` gitlab
docker exec -it gitlab-cicd grep 'Password:' /etc/gitlab/initial_root_password

>> NOTE: Envs base 64 para criação de `secrets` no k8s
- Entrada
```console
echo -n "textostring01" | base64
```
- Saída
```console
dGV4dG9zdHJpbmcwMQ==
```

## Docker Compose STack `MONITORING`