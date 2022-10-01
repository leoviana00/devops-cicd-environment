## Utilizando o docker para criação de `imagens` e ambiente `CICD`

1. [Criação do Dockerfile personalizado do `jenkins`](./jenkins/README.md)
2. [Preparação de uma stack CI e MONITORING - `docker compose`](./compose/README.md)
3. [Preparar um ambiente kubernetes com `kind`](./kind/README.md)

## Docker Install

1. Docker

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```
- popos
- https://linuxhint.com/install-docker-on-pop_os/

2. Compose

```bash
curl -L "https://github.com/docker/compose/releases/download/1.26.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```