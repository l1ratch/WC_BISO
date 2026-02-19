#!/usr/bin/env bash

set -e

echo "========================================="
echo " Root SSH + User Setup Script"
echo " Ubuntu 22.04"
echo "========================================="
echo ""

# Проверка root
if [ "$EUID" -ne 0 ]; then
  echo "Запусти как root или через sudo"
  exit 1
fi

echo "[1/6] Установка пароля root..."

echo "root:root" | chpasswd

echo "✔ Пароль root установлен: root"
echo ""

echo "[2/6] Настройка SSH..."

SSH_CONFIG="/etc/ssh/sshd_config"

# Backup
cp $SSH_CONFIG ${SSH_CONFIG}.backup.$(date +%s)

# Разрешаем root login
sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin yes/g' $SSH_CONFIG

# Разрешаем пароль
sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication yes/g' $SSH_CONFIG

# Отключаем ключи (не обязательно, но для "простого доступа")
sed -i 's/^#\?PubkeyAuthentication .*/PubkeyAuthentication no/g' $SSH_CONFIG

# Убираем ограничения
sed -i 's/^#\?ChallengeResponseAuthentication .*/ChallengeResponseAuthentication no/g' $SSH_CONFIG

echo "✔ SSH настроен"

echo ""
echo "[3/6] Перезапуск SSH..."

systemctl restart ssh || systemctl restart sshd

echo "✔ SSH перезапущен"

echo ""
echo "[4/6] Проверка группы docker..."

if ! getent group docker > /dev/null 2>&1; then
    groupadd docker
    echo "✔ Группа docker создана"
else
    echo "✔ Группа docker уже существует"
fi

echo ""
echo "[5/6] Создание пользователя"

read -p "Введите имя нового пользователя (или Enter чтобы пропустить): " USERNAME

if [ ! -z "$USERNAME" ]; then

    if id "$USERNAME" &>/dev/null; then
        echo "Пользователь уже существует"
    else
        useradd -m -s /bin/bash "$USERNAME"

        echo ""
        echo "Введите пароль для пользователя $USERNAME:"
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
echo "[6/6] Готово"
echo ""

IP=$(hostname -I | awk '{print $1}')

echo "========================================="
echo " Подключение:"
echo ""
echo "ssh root@$IP"
echo "пароль: root"
echo ""
if [ ! -z "$USERNAME" ]; then
echo "или"
echo "ssh $USERNAME@$IP"
fi
echo "========================================="
echo ""
