# -*- mode: ruby -*-
# vi: set ft=ruby :

#ENV['VAGRANT_NO_PARALLEL'] = 'yes'

# vagrant plugin install vagrant-vbguest
# vagrant vbguest

HOST=`printf 'deb-11-' && hostname -s`

Vagrant.configure("2") do |config|
	config.vm.define HOST do |afaraji|
		afaraji.vm.box = "debian/buster64"
		afaraji.vm.hostname = HOST
		afaraji.vm.box_url = "debian/buster64"
		afaraji.vm.network :private_network, ip: "192.168.60.60"
		afaraji.vm.provider :virtualbox do |v|
			v.customize ["modifyvm", :id, "--name", HOST]
			v.customize ["modifyvm", :id, "--memory", 2048]
			v.customize ["modifyvm", :id, "--cpus", "2"]
		end
		#afaraji.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/tmp/id_rsa.pub"
		afaraji.vm.synced_folder ".", "/home/cloud"
		afaraji.vm.provision "shell", inline: <<-SHELL
		apt-get update
		apt-get install -y -q net-tools curl vim python3-pip
		pip3 install ansible
		pip3 install boto boto3
		pip3 install --upgrade requests
		update-alternatives --install /usr/bin/python python /usr/bin/python3 1
		ansible-galaxy collection install amazon.aws
		curl -fsSL https://get.docker.com -o get-docker.sh
		sh get-docker.sh
		systemctl start docker
		systemctl enable docker
		curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
		chmod +x /usr/local/bin/docker-compose
		docker ps && echo "[INFO] Docker installed successful" || echo "[INFO] Error installing Docker"
		rm -rf get-docker.sh
		usermod -aG docker vagrant
		mkdir -p /data/wp_data && mkdir -p /data/db_data && mkdir -p /data/wp_data2 && chmod 777 -R /data/
		SHELL
	end
end

# github pw
# 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
# need to impliment ansible vault, test phpmysql, remove public ip for db
