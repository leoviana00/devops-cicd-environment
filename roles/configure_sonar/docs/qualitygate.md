## 1. Projetos utilizando o Quality Gate padrão `Sonar Way`.

- Acompanhamento pela dashboard do `sonar`.

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-19.png">
</p>

- Acompanhamento pela dashboardo do `jenkins`.

- `java-api-demo-sonar-success`

<p align="center">
  <img alt="Sonar" src="../../../data/jenkins-images/jenkins-admin-37.png">
</p>

- `java-api-demo-sonar-fail`

<p align="center">
  <img alt="Sonar" src="../../../data/jenkins-images/jenkins-admin-38.png">
</p>


## 2. Criando um novo `Quality Gate`

- Passo 1: Quality Gates

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-13.png">
</p>

- Passo 2: Create

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-14.png">
</p>

- Passo 3: Dando nome ao novo Quality Gate

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-15.png">
</p>

- Passo 4: Adicionar uma condição

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-16.png">
</p>

- Passo 5: Cobertura de código menor que 70%

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-17.png">
</p>

- Passo 6: Quality Gate criado

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-18.png">
</p>

## 3. Atribuindo o Quality Gate ao projeto

- Passo 1: Acessar o projeto `java-api-demo-sonar-fail`.

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-20.png">
</p>

- Passo 2:

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-21.png">
</p>

- Passo 3:

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-22.png">
</p>

- Realizar os mesmos passos para o projeto: `java-api-demo-sonar-success`.

## 4. Projetos utilizando o `Quality Gate` criado, `Java Way`.

- Acompanhamento pela dashboard do `sonar`.

<p align="center">
  <img alt="Sonar" src="../../../data/sonar-images/sonar-admin-23.png">
</p>

- Acompanhamento pela dashboard do `jenkins`.
- `java-api-demo-sonar-success`

<p align="center">
  <img alt="Sonar" src="../../../data/jenkins-images/jenkins-admin-40.png">
</p>

- `java-api-demo-sonar-fail`

<p align="center">
  <img alt="Sonar" src="../../../data/jenkins-images/jenkins-admin-39.png">
</p>