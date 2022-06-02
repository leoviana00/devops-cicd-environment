## Monitoramento baseado em ELK

1. Configure um local para armazenar todos os nossos logs ( Elasticsearch ).
2. Configure algo para encaminhar nossos logs para nosso armazenamento ( Logstash ).
3. Serviços de configuração para farmar todos os logs de todos os nossos nós ( Filebeat e Metricbeat ).
4. Configure um serviço para visualizar os logs ( Kibana ).
5. Configure uma entrada para visualizar as visualizações (usaremos o Traefik ).
6. Configure um serviço para excluir logs regularmente para que nosso cluster nunca fique sobrecarregado ( Curator ).

## Tecnologias

- Elasticsearch
- Logstash
- Filebeat
- Metricbeat
- Kibana
- Apm-server
- Traefic
