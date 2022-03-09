<h1 align="center">Pipeline Jenkins</h1>

- Criação do `pipeline` para os dois projetos criados.

## Pipeline `java-api-demo-sonar-fail`

- Stages:
    - Clonar repositório
    - Build com maven
    - Teste com maven
    - Analise com sonar
    - Quality Gate
    
## Pipeline `java-api-demo-sonar-success`

- Stages:
    - Clonar repositório
    - Build com maven
    - Teste com maven
    - Analise com sonar
    - Quality Gat