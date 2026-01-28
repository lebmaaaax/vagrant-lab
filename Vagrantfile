Vagrant.configure("2") do |config|
  # -----------------------------
  # Base box
  # -----------------------------
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "vagrant-lab"

  # -----------------------------
  # Networking
  # -----------------------------

  # Private network (host-only)
  config.vm.network "private_network", ip: "192.168.56.10"

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # -----------------------------
  # Provider settings
  # -----------------------------

  # VM - app

  config.vm.provider "virtualbox" do |app|
    vb.name = "app"
    vb.memory = ENV.fetch("VM_MEMORY", 2048)
    vb.cpus  = ENV.fetch("VM_CPUS", 2)
    db.disksize.size = "20GB"
  end

# Provisioning
    app.vm.provision "shell", path: "provision/bootstrap.sh"
    app.vm.provision "shell", path: "provision/docker.sh"
    app.vm.provision "shell", path: "provision/user.sh"
  end

  # VM - db

  config.vm.provider "virtualbox" do |db|
    vb.name = "db"
    vb.memory = ENV.fetch("VM_MEMORY", 2048)
    vb.cpus  = ENV.fetch("VM_CPUS", 2)
    db.disksize.size = "50GB"
  end

# Provisioning
    app.vm.provision "shell", path: "provision/bootstrap.sh"
    app.vm.provision "shell", path: "provision/docker.sh"
    app.vm.provision "shell", path: "provision/user.sh"
  end

