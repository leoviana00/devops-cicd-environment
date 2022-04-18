## Ferramentas

- Para iniciar é necessário instalar algumas ferramentas:

    - virtualbox
    - vagrant
    - ansible

- Pode ser feito de algumas formas:

1. Instalar separadamente: 

Se você usa sistemas baseados em Debian:
```console
$ sudo apt-get install virtualbox ansible vagrant -y
```

Se você usa sistemas baseados em Arch Linux:
```console
$ sudo pacman -Sy virtualbox ansible vagrant --noconfirm
```

2. Passando o arquivo packages:

Se você usa Debian:
```console
$ xargs -a packages/packages.txt sudo apt-get install -y
```
Ou se você usa Arch Linux:
```console
$ xargs -a packages/packages.txt sudo pacman -Sy --noconfirm
```

3. Através do makefile:

```console
$ make init
```