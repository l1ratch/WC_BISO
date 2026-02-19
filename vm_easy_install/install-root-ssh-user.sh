#!/usr/bin/env bash

set -e

clear

echo "========================================="
echo "   VM Easy Install Script"
echo "   Root SSH + User + Docker Setup"
echo "========================================="
echo ""

########################################
# Проверка root
########################################

if [ "$EUID" -ne 0 ]; then
  echo "Ошибка: запусти через sudo"
  exit 1
fi

########################################
# Получение IP
########################################

IP=$(hostname -I | awk '{print $1}')

########################################
# Root password
########################################

echo "[1/7] Установка пароля root..."

echo "root:root" | chpasswd

echo "✔ Пароль root установлен"
echo ""

########################################
# SSH Setup
########################################

echo "[2/7] Настройка SSH..."

SSH_CONFIG="/etc/ssh/sshd_config"

# Backup один раз
if [ ! -f "${SSH_CONFIG}.backup" ]; then
    cp $SSH_CONFIG ${SSH_CONFIG}.backup
fi

# Удаляем старые ListenAddress
sed -i '/^ListenAddress/d' $SSH_CONFIG

# Добавляем listen на все интерфейсы
echo "ListenAddress 0.0.0.0" >> $SSH_CONFIG

# Функция установки параметра
set_ssh_option() {
    OPTION=$1
    VALUE=$2

    if grep -q "^$OPTION" $SSH_CONFIG; then
        sed -i "s/^$OPTION.*/$OPTION $VALUE/" $SSH_CONFIG
    else
        echo "$OPTION $VALUE" >> $SSH_CONFIG
    fi
}

set_ssh_option "PermitRootLogin" "yes"
set_ssh_option "PasswordAuthentication" "yes"
set_ssh_option "PubkeyAuthentication" "no"
set_ssh_option "ChallengeResponseAuthentication" "no"
set_ssh_option "UsePAM" "yes"
set_ssh_option "UseDNS" "no"

systemctl restart ssh

echo "✔ SSH настроен (0.0.0.0, root login enabled)"
echo ""

########################################
# Docker install
########################################

echo "[3/7] Установка Docker..."

if command -v docker &> /dev/null; then

    echo "✔ Docker уже установлен"

else

    apt update

    apt install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    install -m 0755 -d /etc/apt/keyrings

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
        | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
      "deb [arch=$(dpkg --print-architecture) \
      signed-by=/etc/apt/keyrings/docker.gpg] \
      https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" \
      > /etc/apt/sources.list.d/docker.list

    apt update

    apt install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin

    systemctl enable docker
    systemctl start docker

    echo "✔ Docker установлен"

fi

echo ""

########################################
# Docker group
########################################

echo "[4/7] Проверка группы docker..."

if ! getent group docker > /dev/null; then
    groupadd docker
    echo "✔ Группа docker создана"
else
    echo "✔ Группа docker уже существует"
fi

echo ""

########################################
# Create user
########################################

echo "[5/7] Создание пользователя"

read -p "Введите имя пользователя (Enter чтобы пропустить): " USERNAME

if [ -n "$USERNAME" ]; then

    if id "$USERNAME" &>/dev/null; then

        echo "✔ Пользователь уже существует"

    else

        useradd -m -s /bin/bash "$USERNAME"

        echo ""
        echo "Введите пароль для $USERNAME:"
        passwd "$USERNAME"

        usermod -aG sudo "$USERNAME"
        usermod -aG docker "$USERNAME"

        echo "✔ Пользователь создан"
        echo "✔ Добавлен в sudo"
        echo "✔ Добавлен в docker"

    fi

else

    echo "Пропущено"

fi

echo ""

########################################
# Docker test
########################################

echo "[6/7] Проверка Docker..."

docker --version

echo "✔ Docker работает"

echo ""

########################################
# Done
########################################

echo "[7/7] Готово"
echo ""

echo "========================================="
echo " SSH доступ:"
echo ""
echo " root:"
echo " ssh root@$IP"
echo " password: root"
echo ""

if [ -n "$USERNAME" ]; then
echo " user:"
echo " ssh $USERNAME@$IP"
fi

echo ""
echo " SSH слушает:"
echo " 0.0.0.0:22"
echo ""
echo " Docker команды:"
echo " docker ps"
echo " docker compose version"
echo ""
echo "========================================="
