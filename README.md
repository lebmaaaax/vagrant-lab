# Vagrant Local Lab

Данный репозиторий содержит конфигурацию для развёртывания локального инфраструктурного окружения с помощью **Vagrant** и **VirtualBox**.

## Требования

На хост-машине должны быть установлены:
- **VirtualBox** https://www.virtualbox.org/wiki/Downloads
- **Vagrant** https://developer.hashicorp.com/vagrant/install
- vagrant plugin install vagrant-disksize

## Описание окружения

В рамках проекта разворачивается:

- **ОС:** Ubuntu 22.04 (jammy64)
- **Провайдер:** VirtualBox
- **Сеть:**
  - NAT — для выхода в интернет
  - Private (host-only) network — для доступа с хоста
- **Статический IP VM:** `192.168.56.10`

Виртуальная машина использует NAT для доступа в интернет и private network для локального взаимодействия с хостом.

---

## Структура репозитория

```text
.
├── Vagrantfile
├── README.md
├── provision/
│   ├── bootstrap.sh
│   ├── docker.sh
│   ├── users.sh
└── .gitignore
```

## Запуск

vagrant up         # поднимет обе VM
vagrant up app     # только app
vagrant up db      # только db

vagrant ssh app    # подключение к app
vagrant ssh db     # только db

vagrant status     # проверить статус VM
vagrant halt       # остановить VM
vagrant reload     # перезапустить VM
vagrant destroy    # удалить VM
