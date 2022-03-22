<h1 align="center">Docker Hub</h1>

<p align="center">
  <img alt="Dockerhub" src="../data/dockerhub.png">
</p>


<h1 align="center">Prepararação do dockerfile </h1>

<p align="center">
  <img alt="Dockerhub" src="../data/docker_jenkins.png">
</p>

- Gerar uma imagem contendo:
    - jenkins
    - docker
    - add user `jenkins` ao grupo docker
    - jdk
    - maven
    - git

## Build

- Buildando a imagen:

```console
docker build -t jenkins_project .
```

## Tag

- Dando uma tag para a imagem:

```console
docker image tag jenkins_project leoviana00/jenkins_project:0.1.0
```

## Login dockerhub

- Depois de criar uma conta no dockerhub, logar nela:

```console
docker login
```

## Push

- Evaindo a imagem para o `dockerhub`:

```console
docker push leoviana00/jenkins_project:0.1.0
```

<p align="center">
  <img alt="Dockerhub" src="../data/dockerhub-jenkins.png">
</p>
