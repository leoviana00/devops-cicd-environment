# Instalando ferramentas necessárias
init:
	if [ -x /usr/bin/pacman ]; then \
		xargs -a packages/packages.txt sudo pacman -Sy --noconfirm; \
	elif [ -x /usr/bin/apt-get ]; then \
		xargs -a packages/packages.txt sudo apt-get install -y; \
	elif [ -x /usr/bin/yum ]; then \
		xargs -a packages/packages.txt sudo yum -y install; \
	else \
		echo "No package manager found"; \
	fi
	

# Inicializando configuração do docker nos hosts
container:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags setup

# Inicializando configuração do jenkins
jenkins:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags jenkins

# Inicializando configuração do registry
registry:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags registry

# Inicializando configuração do sonar
sonar:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags sonar

# Inicializando configuração do gitlab
gitlab:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags gitlab

# Inicializando configuração do docker, jenkins, sonar e gitlab
setup:
	ansible-playbook -i inventories/virtualbox.yaml site.yaml --tags setup,jenkins,sonar,gitlab,registry

# Inicializando as vms com vagrant
vagrant_up:
	bash scripts/vagrant_up.sh

# Destruindo as vms com vagrant
vagrant_destroy:
	bash scripts/vagrant_destroy.sh 