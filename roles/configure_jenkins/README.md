<p align="center">
  <a href="#configurações-iniciais">Configurações Iniciais</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#plugins">Plugins</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#credenciais">Credenciais</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#configurações-globais">Configurações Globais</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#configurações-do-sistema">Configurações do sistema</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#job">Job</a>
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-logo.jpg">
</p>

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
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-1.png">
</p>

2. Login no jenkins

- URL: http://192.168.10.20:8080/

- Unlock Jenkins

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-2.png">
</p>

3. Instalação padrão dos plugins

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-3.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-4.png">
</p>

4. Criar o primeiro usuário admin

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-5.png">
</p>

5. Verificando a url de acesso

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-6.png">
</p>

6. Inicializando o Jenkins

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-7.png">
</p>

7. Tela inicial do jenkins

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-8.png">
</p>

## Plugins

1. Plugins a serem instalados

- GitLab 
- HTTP Request
- Config File Provider
- Logstash
- JaCoCo
- Docker
- SonarQube Scanner
- Pipeline Utility Steps

2. Passos da instalação, pegando o `GitLab` como exemplo:

- Passo 1:

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-14.png">
</p>

- Passo 2:

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-15.png">
</p>


## Credenciais

1. Criando algumas `credenciais`

- Criar Chave privada e pública do Jenkins

- Passo 1: Acessar a vm do 
```console
ssh -i keys/vagrant vagrant@192.168.10.20
```

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-18.png">
</p>

- Passo 2: Acessar o container jenkins

```console
docker exec -it jenkins
```
<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-19.png">
</p>

- Passo 3: Mudando para usuário `jenkins`

```console
su jenkins
```
<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-20.png">
</p>

- Passo 4: Criar chaves ssh

```console
ssh-keygen
```
<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-21.png">
</p>

- Passo 5: Copiando a chave privada e criando uma credencial no jenkins com ela.

```console
cat ~/.ssh/id_rsa
```

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-22.png">
</p>

- Manage Credentials

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-9.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-10.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-11.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-12.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-13.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-23.png">
</p>

- Passo 6: Copiar a chave pública

```console
cat ~/.ssh/id_rsa.pub
```
<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-24.png">
</p>

- Passo 7: Logar no `gitlab` com o usuário jenkins
- Passo 8: Adicionar a chave publica no GitLab

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-25.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-26.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-27.png">
</p>



- [Api Token Gitlab](../configure_gitlab/README.md)

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-16.png">
</p>

- [Api Token SonarQube](../configure_sonar/README.md)

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-28.png">
</p>

## Configurações-do-sistema

1. Configuração do `GitLab`.

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-17.png">
</p>

## Configurações-globais

1. Configuração `Maven`

<p align="center">
  <img alt="Jenkins" src="../../data/jenkins-images/jenkins-admin-29.png">
</p>

## Job

1. Criando `Pipeline` java.