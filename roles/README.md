## Roles 
- Configure Hosts (Para configurar o docker nas VMs)
- Registry (Para subir um registry privado e poder guardar nossas imagens)
- Gitlab (Para subir um gitlab privado para versionamento do código)
- Jenkins (Para subir e configurar o jenkins)
- Sonar (Para subir o Sonar)

## Inventories
- O arquivo inventories é onde estão registrados algumas variáveis de ambientes, hosts e grupos.

## Tags - site.yaml
- `site.yaml` é o arquivo princiapal, onde chamará as rules através das `tags` criadas.

- setup
- jenkins
- sonar
- gitlab
- registry

## Inicialização 

1. Forma 1:

- Chamando diretamente pelo comando `ansible-playbook` apontando para a tag do serviço que deseja subir.

- Docker:

```console
$ ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags setup
```
