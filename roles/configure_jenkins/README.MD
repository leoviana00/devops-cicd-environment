<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-logo.jpg">
</p>

## Inial Password

- Forma 1: Acessar a VM do Jenkins

```console
ssh -i keys/vagrant vagrant@192.168.10.20
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
<p align="center">
  <img alt="Jenkins" src="../../data/password-initila-jenkins-1.png">
</p>

- Forma 2: Rodar playbook jenkins com as tasks descomentadas - `Pegar init password Jenkins` e `Imprimir init password Jenkins`.

<p align="center">
  <img alt="Jenkins" src="../../data/password-initial-jenkins.png">
</p>

- URL: http://192.168.10.20:8080/

- Unlock Jenkins

<p align="center">
  <img alt="Jenkins" src="../../data/unlock-jenkins.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins.png">
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