<h1 align="center">DevOps</h1>

<p align="center">
  <img alt="DevOps" src="https://img.shields.io/static/v1?label=DevOps&message=CICD&color=8257E5&labelColor=000000"  />

  <img alt="License" src="https://img.shields.io/static/v1?label=license&message=MIT&color=49AA26&labelColor=000000">
</p>

<p align="center">
  <a href="#-projeto">Projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#%EF%B8%8F-ambiente">Ambiente</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-execução">Execução</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-licença">Licença</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-referências">Referências</a>
</p>

<p align="center">
  <img alt="DevOps" src="data/devops-process.png">
</p>


## 🌱 Projeto

- Construção de uma ambiente CICD:

<h2 align="center">Backlog</h2>

- Criação das vms utilizando `vagrant` e `virtualbox` para:
    - GitLab
    - Registry
    - Jenkins
    - Sonar
- Construção de Playbook com `ansible` para configuração:
    - Docker
    - GitLab
    - Registry
    - Jenkins
    - Sonar
- `Integração` entre as ferramentas:
    - GitLab
    - Jenkins
    - Sonar
- Criação de uma `API`:
    - Java
    - Spring
- Criação de `Pipeline`:
    - CICD:
      - Stages:
        - Clonar repositório
        - Maven Build
        - Maven Test
        - Análise SOnar
        - Sonar Quality Gate
        - Build Docker
          - Gerar imagem do app
          - Eviar para o registry privado
        - Deploy

## ✨ Tecnologias

- Vagrant  
- Ansible 
- Java 
- Springboot
- Gitlab 
- Jenkins 
- Maven 
- Sonar 
- Registry 
- Docker 


## 🛠️ Ambiente 

- Provisionamento e configuração da Infra

<p align="center">
  <img alt="Ambiente" src="data/provisionamento.png">
</p>

- Arquitetura

<p align="center">
  <img alt="Ambiente" src="data/ambiente.png">
</p>

## 🚀 Execução

- [Instalando ferramentas necessárias](packages/README.md) 
```console
make init
```

- [Inicializando as vms com vagrant](vagrant/README.MD) 
```console
make vagrant_up
```

- [Configuração das vms](roles/README.md) 
```console
make setup
```

## 📄 Licença
Esse projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🙇 Referências

...
