## Baixar e instalar o `LENS`

- [Download](https://k8slens.dev/)

## Adicionando o cluster no `LENS`

1. Logar no `control plane`

```console
vagrant ssh k8s-control
```

2. Copiar o conteúdo do `admin.conf`

```console
sudo cat /etc/kubernetes/admin.conf
```

<p align="center">
  <img alt="k8s" src="../../../data/k8s-images/k8s-admin-9.png">
</p>

3. Abrir o `lens` e ir em `file`

<p align="center">
  <img alt="k8s" src="../../../data/k8s-images/lens-admin-1.png">
</p>

4. Colar o conteúdo do `admin.conf` e `add cluster`

<p align="center">
  <img alt="k8s" src="../../../data/k8s-images/lens-admin-2.png">
</p>

5. Visualizar o `cluster` no `Browse` e clicar nele

<p align="center">
  <img alt="k8s" src="../../../data/k8s-images/lens-admin-3.png">
</p>

4. Abrindo o `cluster`

<p align="center">
  <img alt="k8s" src="../../../data/k8s-images/lens-admin-4.png">
</p>

5. Dashboard

<p align="center">
  <img alt="k8s" src="../../../data/k8s-images/lens-admin-5.png">
</p>