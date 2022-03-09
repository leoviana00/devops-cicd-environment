<h2 align="center">Etapas do projeto</h2>

1. Instalação das dependências necessárias
2. Criar chaves `SSH` para o projeto
3. Criação das vms utilizando `vagrant` e `virtualbox` para:
    - GitLab
    - Registry
    - Jenkins
    - Sonar
4. Construção de Playbook com `ansible` para configuração:
    - Docker
    - GitLab
    - Registry
    - Jenkins
    - Sonar
5. `Integração` entre as ferramentas:
    - GitLab
    - Jenkins
    - Sonar
6. Criação de uma `API`:
    - Java
    - Spring
7. Criação de `Pipeline`:
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
