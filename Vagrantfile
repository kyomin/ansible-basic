# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant_API_Version = "2"

Vagrant.configure(Vagrant_API_Version) do |config|
  config.vm.define:"ansible-server" do |cfg|
      cfg.vm.box = "centos/7"
    cfg.vm.provider:virtualbox do |vb|
      vb.name="Ansible-Server(Jake)"      
    end
    cfg.vm.host_name="ansible-server"
    cfg.vm.synced_folder ".", "/vagrant", disabled: true

    # 네트워크 설정
    cfg.vm.network "public_network", ip: "192.168.219.10"
    cfg.vm.network "forwarded_port", guest: 22, host: 19210, auto_correct: false, id: "ssh"

    # 프로비저닝 설정
    cfg.vm.provision "shell", path: "bootstrap.sh"  # bootstrap.sh에 있는 쉘 명령어 실행
    cfg.vm.provision "file", source: "Ansible_env_ready.yml", destination: "Ansible_env_ready.yml"  # 현재 경로에 있는 파일을 원격에 전송
    cfg.vm.provision "shell", inline: "ansible-playbook Ansible_env_ready.yml"  # 쉘 모듈을 이용해 해당 야믈 파일 실행
  end
end
