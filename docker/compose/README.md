# Iniciando o `jenkins` e o `sonar`.
docker-compose up -d

# Pegar o `initial admin password` jenkins
docker exec jenkins-cicd cat /var/jenkins_home/secrets/initialAdminPassword

# Confirmar se o jenkins está `running`
docker ps

# Pegar o `initial admin password` gitlab
docker exec -it gitlab-cicd grep 'Password:' /etc/gitlab/initial_root_password

# Envs base 64 para criação de `secrets` no k8s
- Entrada
```console
echo -n "textostring01" | base64
```
- Saída
```console
dGV4dG9zdHJpbmcwMQ==
```