# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant_API_Version = "2"

Vagrant.configure(Vagrant_API_Version) do |config|
  #================#
  # Ansible-Node01 #
  #================#
  config.vm.define:"ansible-node01" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Node01(Jake)"      
      vb.customize ["modifyvm", :id, "--cpus", 1]
      vb.customize ["modifyvm", :id, "--memory", 512]
    end
    cfg.vm.host_name="ansible-node01"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true

    # 네트워크 설정
    cfg.vm.network "public_network", ip: "192.168.219.11"
    cfg.vm.network "forwarded_port", guest: 22, host: 60011, auto_correct: false, id: "ssh"

    # 프로비저닝 설정
    cfg.vm.provision "shell", path: "bash_ssh_conf_4_CentOS.sh"
  end

  #================#
  # Ansible-Node02 #
  #================#
  config.vm.define:"ansible-node02" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Node02(Jake)"      
      vb.customize ["modifyvm", :id, "--cpus", 1]
      vb.customize ["modifyvm", :id, "--memory", 512]
    end
    cfg.vm.host_name="ansible-node02"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true

    # 네트워크 설정
    cfg.vm.network "public_network", ip: "192.168.219.12"
    cfg.vm.network "forwarded_port", guest: 22, host: 60012, auto_correct: false, id: "ssh"

    # 프로비저닝 설정
    cfg.vm.provision "shell", path: "bash_ssh_conf_4_CentOS.sh"
  end

  #================#
  # Ansible Server #
  #================#
  config.vm.define:"ansible-server" do |cfg|
    cfg.vm.box = "centos/7"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Server(Jake)"      
    end
    cfg.vm.host_name="ansible-server"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true
  
    # 네트워크 설정
    cfg.vm.network "public_network", ip: "192.168.219.10"
    cfg.vm.network "forwarded_port", guest: 22, host: 60010, auto_correct: false, id: "ssh"

    # 프로비저닝 설정
    cfg.vm.provision "shell", inline: "yum install epel-release -y"
    cfg.vm.provision "shell", inline: "yum install ansible -y"
    cfg.vm.provision "file", source: "Ansible_env_ready.yml", destination: "Ansible_env_ready.yml"  # 현재 경로에 있는 파일을 원격에 전송
    cfg.vm.provision "shell", inline: "ansible-playbook Ansible_env_ready.yml"  # 쉘 모듈을 이용해 해당 야믈 파일을 ansible-playbook 명령어로 실행
    cfg.vm.provision "shell", path: "add_ssh_auth.sh", privileged: false  # add_ssh_auth에 있는 쉘 명령어 실행
    cfg.vm.provision "file", source: "Ansible_ssh_conf_4_CentOS.yml", destination: "Ansible_ssh_conf_4_CentOS.yml"
    cfg.vm.provision "shell", inline: "ansible-playbook Ansible_ssh_conf_4_CentOS.yml"
    cfg.vm.provision "file", source: "nginx_install.yml", destination: "nginx_install.yml"
    cfg.vm.provision "file", source: "nginx_remove.yml", destination: "nginx_remove.yml"
  end
end
