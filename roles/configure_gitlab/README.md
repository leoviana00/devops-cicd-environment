<h1 align="center">GitLab</h1>

## 1. Initial Root Password: 

1. Acessar a vm
```console
ssh -i keys/vagrant vagrant@192.168.10.10
```

2. Pegando o initial password através do comando abaixo:
```console
sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```

<p align="center">
  <img alt="GitLab" src="../../data/initial-password-root-gitlab.png">
</p>


## 2. Login

- URL: http://192.168.10.10

<p align="center">
  <img alt="GitLab" src="../../data/gitlab.png">
</p>

```console
user: root
password: initial_root_password
```

## 3. Redefinindo o password do `admin`

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-1.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-2.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-3.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-4.png">
</p>

## 4. Criando um `token` para fazer a integração com o `jenkins`.

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-9.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-10.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-11.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-12.png">
</p>

## 5. Criando usuário `jenkins`.

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-1.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-2.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-5.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-6.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-7.png">
</p>

<p align="center">
  <img alt="GitLab" src="../../data/gitlab-images/git-admin-8.png">
</p>