Vagrant.configure("2") do |config|
  # Базовый box
  config.vm.box = "ubuntu/jammy64"

  # Общие настройки для всех VM
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 2
    vb.memory = 2048
  end

  # =========================
  # APP VM
  # =========================
  config.vm.define "app" do |app|
    app.vm.hostname = "app"

    # Private network — доступ с хоста и между VM
    app.vm.network "private_network", ip: "192.168.56.10"

    # Диск для приложения
    # Требуется plugin: vagrant-disksize
    db.disksize.size = "20GB"

    # Provisioning
    app.vm.provision "shell", path: "scripts/bootstrap.sh"
    app.vm.provision "shell", path: "scripts/docker.sh"
    app.vm.provision "shell", path: "scripts/user.sh"
    app.vm.provision "shell", path: "scripts/app.sh"

    # Ресурсы app меньше — логично
    app.vm.provider "virtualbox" do |vb|
      vb.name = "app"
      vb.memory = 2048
      vb.cpus = 2
    end
  end

  # =========================
  # DB VM
  # =========================
  config.vm.define "db" do |db|
    db.vm.hostname = "db"

    # Private network — связь с app
    db.vm.network "private_network", ip: "192.168.56.11"

    # Увеличенный диск для БД
    # Требуется plugin: vagrant-disksize
    db.disksize.size = "50GB"

    # Provisioning
    db.vm.provision "shell", path: "scripts/bootstrap.sh"
    db.vm.provision "shell", path: "scripts/user.sh"
    db.vm.provision "shell", path: "scripts/db.sh"

    db.vm.provider "virtualbox" do |vb|
      vb.name = "db"
      vb.memory = 2048
      vb.cpus = 2
    end
  end
end

