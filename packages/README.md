## Ferramentas

- Para iniciar é necessário instalar algumas ferramentas:

    - virtualbox
    - vagrant
    - ansible

- Pode ser feito de algumas formas:

1. Instalar separadamente: 

```console
$ sudo apt-get install virtualbox -y
$ sudo apt-get install vagrant -y
$ sudo apt-get install ansible -y
```

2. Passando o arquivo packages:

```console
$ xargs -a packages/packages.txt sudo apt-get install -y
```

3. Através do makefile:

```console
$ make init
```
