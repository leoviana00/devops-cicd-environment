## GitLab

- URL: http://192.168.10.10

<p align="center">
  <img alt="GitLab" src="../../data/gitlab.png">
</p>

## Initial Root Password: 

- Acessar a vm
```console
ssh -i keys/vagrant vagrant@192.168.10.10
```

- Executar o comando abaixo:
```console
sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
```

<p align="center">
  <img alt="GitLab" src="../../data/initial-password-root-gitlab.png">
</p>

