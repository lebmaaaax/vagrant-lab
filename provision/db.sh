#!/usr/bin/env bash
set -e

echo "=== DB provisioning started ==="

# Обновление пакетов
apt-get update -y

# Установка PostgreSQL (если не установлен)
if ! command -v psql >/dev/null 2>&1; then
  apt-get install -y postgresql postgresql-contrib
fi

# Включаем автозапуск
systemctl enable postgresql
systemctl start postgresql

# Настройки PostgreSQL
PG_CONF="/etc/postgresql/14/main"
PG_HBA="$PG_CONF/pg_hba.conf"
PG_MAIN="$PG_CONF/postgresql.conf"

# Разрешаем слушать private network
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/g" $PG_MAIN

# Разрешаем доступ с app VM
if ! grep -q "192.168.56.10/32" $PG_HBA; then
  echo "host    all     all     192.168.56.10/32     md5" >> $PG_HBA
fi
