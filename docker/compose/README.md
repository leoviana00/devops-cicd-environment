# Start the my-jenkins-3 container
docker-compose up -d

# Get the initial admin password jenkins
docker exec jenkins-cicd cat /var/jenkins_home/secrets/initialAdminPassword

# Confirm the my-jenkins-3 container is running
docker ps

# Get the initial admin password gitlab
docker exec -it gitlab-cicd grep 'Password:' /etc/gitlab/initial_root_password

# Envs base 64
- Entrada
```console
echo -n "textostring01" | base64
```
- Saída
```console
dGV4dG9zdHJpbmcwMQ==
```