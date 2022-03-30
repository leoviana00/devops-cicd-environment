## Ferramentas

- Para iniciar é necessário instalar algumas ferramentas:

    - virtualbox
    - vagrant
    - ansible

- Pode ser feito de algumas formas:

1. Instalar separadamente: 

Se você usa sistemas baseados em Debian (Ubuntu, PopOs, etc):
```console
$ sudo apt-get install virtualbox ansible vagrant -y
```

Se você usa sistemas baseados em Arch Linux (Manjaro, Artix):

```console
$ sudo pacman -Sy virtualbox vagrant ansible --noconfirm
```

2. Passando o arquivo packages:

```console
$ xargs -a packages/packages.txt sudo apt-get install -y
```

3. Através do makefile:

```console
$ make init
```
