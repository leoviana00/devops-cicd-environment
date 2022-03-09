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

<h1 align="center">SonarQube</h1>

1. Logar no Sonar
2. Gerar um token para integração com o `Jenkins`
0. [Instruções](./configure_sonar/README.md)

<h1 align="center">Jenkins</h1>

1. [Configurações Iniciais](./configure_jenkins/docs/configuracoes-iniciais.md)
2. [Plugins](./configure_jenkins/docs/plugins.md)
3. [Credenciais](./configure_jenkins/docs/credenciais.md)
4. [Configurações do Sistema](./configure_jenkins/docs/configuracoes-sistema.md)
5. [Configurações Globais](./configure_jenkins/docs/configuracoes-globais.md)
6. [Job - Pipeline Java]()