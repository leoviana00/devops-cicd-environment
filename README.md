<h1 align="center">DevOps</h1>

<p align="center">
  <img alt="DevOps" src="https://img.shields.io/static/v1?label=DevOps&message=CICD&color=8257E5&labelColor=000000"  />

  <img alt="License" src="https://img.shields.io/static/v1?label=license&message=MIT&color=49AA26&labelColor=000000">
</p>

<p align="center">
  <a href="#-projeto">Projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#%EF%B8%8F-ambiente">Ambiente</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-etapas">Etapas</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-licença">Licença</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-referências">Referências</a>
</p>

<p align="center">
  <img alt="DevOps" src="data/devops-process.png">
</p>


## 🌱 Projeto

- Construção de uma ambiente CICD

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

- A infraestrutura e configurações dos serviços foram feitas utilizando o `ansible`, `vagrant` e `virtualbox`.

1. [Diagrama da arquitetura e do provisionamento de infra e serviços](./docs/arquitetura.md)

## 🚀 Etapas
0. [Planejamento - Etapas do projeto](./docs/stages.md) 
1. [Dependências necessárias](packages/README.md) 
2. [Chave pública e privada](keys/README.md)
3. [Provisionamento da infraestrutura](vagrant/README.MD) 
4. [Provisionamento dos serviços](roles/README.md) 
5. [Integração dos serviços](roles/integration.md) 
6. [Construção da API rest](./app-spring/README.md)
7. [Desenvolvimento da Pipeline](./roles/configure_jenkins/files/jenkinsfile/README.md)

## 📚 Estudando como farei a parte de deploy

>> Nota: Tecnologias sendo estudadas:

1. `Ambiente Kubernetes`
2. `Dashboard LENS`
3. `Deploy com Argo CD`
4. `Haproxy Ingress Controller`

- [Laboratório de estudo](./vagrant/k8s/README.md)

## 📄 Licença
Esse projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 🙇 Referências

1. [Ansible](https://docs.ansible.com/ansible_community.html) 
2. [Jenkins](https://www.jenkins.io/doc/) 
3. [Docker](https://docs.docker.com/)
4. [Sonar](https://docs.sonarqube.org/latest/)
5. [Integração GitLab e Jenkins](https://docs.gitlab.com/ee/integration/jenkins.html)
6. [Integração Sonarqube e Jenkins](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-jenkins/#:~:text=Log%20into%20Jenkins%20as%20an,a%20'Secret%20Text'%20credential.)
7. [GitLab Docker Images](https://docs.gitlab.com/ee/install/docker.html)