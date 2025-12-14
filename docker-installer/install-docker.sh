#!/bin/bash

# Скрипт автоматической установки Docker и Docker Compose V2
# БЕЗ ИНТЕРАКТИВНЫХ ДИАЛОГОВ
# Использование: sudo bash install-docker.sh

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

# ⭐ КРИТИЧНО: Установите переменные окружения для неинтерактивной работы
export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_MODE=a

echo "📦 Обновление репозиториев (без диалогов)..."
apt-get update -y

echo "📦 Обновление пакетов (без диалогов)..."
apt-get upgrade -y \
  -o Dpkg::Options::="--force-confnew" \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Pre-Install-Pkgs::="/bin/true"

echo "📦 Установка зависимостей (без диалогов)..."
apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  -o Dpkg::Options::="--force-confnew" \
  -o Dpkg::Options::="--force-confdef"

# Добавление GPG ключа Docker
echo "🔑 Добавление GPG ключа Docker..."
mkdir -p /usr/share/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Добавление репозитория Docker
echo "📝 Добавление репозитория Docker..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# Обновление репозиториев с новым репозиторием Docker
echo "📦 Обновление репозиториев с Docker..."
apt-get update -y

# Удаление старого docker.io если установлен
echo "🗑️  Удаление старого docker.io (если установлен)..."
apt-get remove -y docker.io || true

# Удаление старого docker-compose V1 если установлен
echo "🗑️  Удаление старого docker-compose V1 (если установлен)..."
apt-get remove -y docker-compose || true

# ⭐ Установка Docker CE БЕЗ ДИАЛОГОВ
echo "🐳 Установка Docker CE (без диалогов)..."
apt-get install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  -o Dpkg::Options::="--force-confnew" \
  -o Dpkg::Options::="--force-confdef"

# ⭐ Установка Docker Compose V2 БЕЗ ДИАЛОГОВ
echo "🐳 Установка Docker Compose V2 Plugin (без диалогов)..."
apt-get install -y \
  docker-compose-plugin \
  -o Dpkg::Options::="--force-confnew" \
  -o Dpkg::Options::="--force-confdef"

# Очистка
echo "🧹 Очистка пакетов..."
apt-get autoclean -y
apt-get autoremove -y

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
if docker run --rm hello-world > /dev/null 2>&1; then
  echo "✅ Docker работает корректно!"
else
  echo "⚠️  Проблема с Docker"
fi

echo ""
echo "Готово к использованию!"
