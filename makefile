# Instalando ferramentas necessárias
init:
	xargs -a packages/packages.txt sudo apt-get install -y

# Inicializando configuração do docker nos hosts
docker:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags setup

# Inicializando configuração do jenkins
jenkins:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags jenkins

# Inicializando configuração do sonar
sonar:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags sonar

# Inicializando configuração do gitlab
gitlab:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags gitlab

# Inicializando configuração do docker, jenkins, sonar e gitlab
setup:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags setup.jenkins,sonar,gitlab

# Inicializando as vms com vagrant
vagrant_up:
	bash scripts/vagrant_up.sh

# Destruindo as vms com vagrant
vagrant_destroy:
	bash scripts/vagrant_destroy.sh 