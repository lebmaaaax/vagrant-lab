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
  config.vm.provider "virtualbox" do |vb|
    vb.name = "vagrant-lab"
    vb.memory = ENV.fetch("VM_MEMORY", 2048)
    vb.cpus  = ENV.fetch("VM_CPUS", 2)
  end

  # -----------------------------
  # Synced folders
  # -----------------------------
  # По умолчанию:
  # ./ (repo) -> /vagrant inside VM
  # Можно добавить свои:
  # config.vm.synced_folder "./app", "/opt/app"

  # -----------------------------
  # Provisioning
  # -----------------------------

  config.vm.provision "shell",
    path: "provision/bootstrap.sh",
    privileged: true

  config.vm.provision "shell",
    path: "provision/docker.sh",
    privileged: true
