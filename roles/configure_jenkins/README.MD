<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-logo.jpg">
</p>

## 1. Pegar `Inial Admin Password`

- Acessar a vm do jenkins.

```console
ssh -i keys/vagrant vagrant@192.168.10.20
```
- Pegar o `initialAdminPassword`.

```console
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-1.png">
</p>

## 2. Login no jenkins

- URL: http://192.168.10.20:8080/

- Unlock Jenkins

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-2.png">
</p>

- Instalação padrão dos plugins

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-3.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-4.png">
</p>

## Plugins necessários

- GitLab Plugin
- HTTP Request
- Config File Provider
- Logstash
- JaCoCo
- Docker
- SonarQube Scanner
- Pipeline Utility Steps