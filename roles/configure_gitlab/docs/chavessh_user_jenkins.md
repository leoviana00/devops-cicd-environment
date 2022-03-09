## Colocar chave ssh do Jenkins no GitLab - User Jenkins 

- Acessar a vm do jenkins
```console
ssh -i keys/vagrant vagrant@192.168.10.20
```

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-18.png">
</p>


- Acessar o container jenkins

```console
docker exec -it jenkins /bin/bash
```
<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-19.png">
</p>

- Mudando para usuário `jenkins`

```console
su jenkins
```
<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-20.png">
</p>

- Copiar a chave pública

```console
cat ~/.ssh/id_rsa.pub
```
<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-24.png">
</p>

- Logar no `gitlab` com o usuário jenkins

- Adicionar a chave publica no GitLab

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-25.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-26.png">
</p>

<p align="center">
  <img alt="Jenkins" src="../../../data/jenkins-images/jenkins-admin-27.png">
</p>
