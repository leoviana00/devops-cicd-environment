## Configurações-Iniciais

1. Pegar `Inial Admin Password`

- Acessar a vm do jenkins.

```console
ssh -i keys/vagrant vagrant@192.168.10.20
```
- Pegar o `initialAdminPassword`.

```console
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
```
<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-1.png">
</p>

2. Login no jenkins

- URL: http://192.168.10.20:8080/

- Unlock Jenkins

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-2.png">
</p>

3. Instalação padrão dos plugins

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-3.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-4.png">
</p>

4. Criar o primeiro usuário admin

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-5.png">
</p>

5. Verificando a url de acesso

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-6.png">
</p>

6. Inicializando o Jenkins

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-7.png">
</p>

7. Tela inicial do jenkins

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-8.png">
</p>