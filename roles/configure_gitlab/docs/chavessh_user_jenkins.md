## Colocar chave ssh do Jenkins no GitLab - User Jenkins 

- Entar no container que está rodando o serviço `jenkins`
- Sair do user root para o usuário jenkins
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
