## Integração

- Informações que vamos precisar:

```console
- gitlab_access_token: ""
- sonarqube_token_secret: ""
- registry_pull_secret: ""
```

## Etapas da integração

<h1 align="center">GitLab</h1>

1. Pegar o `initial password` e logar com o usuário `root`
2. Redefinir o password do user `admin`, pois o `initial password` é temporário.
3. Criar um token
4. Criar o usuário `jenkins`
0. [Instruções](./configure_gitlab/README.md)