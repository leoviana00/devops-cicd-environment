## Credenciais

1. Criando algumas `credenciais`

- Criar Chave privada e pública do Jenkins

- Passo 1: Acessar a vm do jenkins
```console
ssh -i keys/vagrant vagrant@192.168.10.20
```

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-18.png">
</p>

- Passo 2: Acessar o container jenkins

```console
docker exec -it jenkins
```
<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-19.png">
</p>

- Passo 3: Mudando para usuário `jenkins`

```console
su jenkins
```
<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-20.png">
</p>

- Passo 4: Criar chaves ssh

```console
ssh-keygen
```
<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-21.png">
</p>

- Passo 5: Copiando a chave privada e criando uma credencial no jenkins com ela.

```console
cat ~/.ssh/id_rsa
```

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-22.png">
</p>

- Manage Credentials

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-9.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-10.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-11.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-12.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-13.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-23.png">
</p>

- [Colocar chave ssh pública do Jenkins no GitLab](../../configure_gitlab/docs/chavessh_user_jenkins.md)

- [Api Token Gitlab](../../configure_gitlab/docs/token.md)

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-16.png">
</p>

- [Api Token SonarQube](../../configure_sonar/docs/token.md)

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-28.png">
</p>