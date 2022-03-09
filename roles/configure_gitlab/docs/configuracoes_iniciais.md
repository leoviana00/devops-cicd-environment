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
- password: `initial_root_password`

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