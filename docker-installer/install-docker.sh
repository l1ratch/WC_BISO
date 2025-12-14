#!/bin/bash

# Скрипт автоматической установки Docker и Docker Compose V2
# Использование: bash install-docker.sh

set -e

echo "=========================================="
echo "Установка Docker и Docker Compose V2"
echo "=========================================="
echo ""

# Проверка прав sudo
if [[ $EUID -ne 0 ]]; then
   echo "❌ Этот скрипт должен быть запущен с sudo"
   echo "Используйте: sudo bash install-docker.sh"
   exit 1
fi

# Обновление репозиториев
echo "📦 Обновление репозиториев..."
apt update
apt upgrade -y

# Установка зависимостей
echo "📦 Установка зависимостей..."
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Добавление GPG ключа Docker
echo "🔑 Добавление GPG ключа Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Добавление репозитория Docker
echo "📝 Добавление репозитория Docker..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Обновление репозиториев с новым репозиторием Docker
echo "📦 Обновление репозиториев с Docker..."
apt update

# Удаление старого docker.io если установлен
echo "🗑️  Удаление старого docker.io (если установлен)..."
apt remove -y docker.io || true

# Установка Docker
echo "🐳 Установка Docker CE..."
apt install -y docker-ce docker-ce-cli containerd.io

# Установка Docker Compose V2
echo "🐳 Установка Docker Compose V2 Plugin..."
apt install -y docker-compose-plugin

# Включение автозапуска Docker
echo "⚙️  Включение автозапуска Docker..."
systemctl enable docker
systemctl start docker

# Проверка версий
echo ""
echo "=========================================="
echo "✅ Установка завершена!"
echo "=========================================="
echo ""
echo "Версии:"
docker --version
docker compose version
echo ""

# Информация о добавлении пользователя в группу docker
echo "💡 Чтобы использовать docker без sudo, добавьте пользователя в группу:"
echo "   sudo usermod -aG docker \$USER"
echo "   newgrp docker"
echo ""

# Проверка работоспособности
echo "🧪 Тестирование Docker..."
docker run --rm hello-world > /dev/null 2>&1 && echo "✅ Docker работает корректно!" || echo "⚠️  Проблема с Docker"

echo ""
echo "Готово к использованию!"
