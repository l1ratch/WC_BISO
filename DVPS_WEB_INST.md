### **Подробная инструкция по созданию Docker-образа**  
**Цель**: Создать кастомный образ на основе `nginx` с простой HTML-страницей.  

---

## **1. Подготовка окружения**
### **1.1. Установка Docker**
Если Docker не установлен, выполните:  
```
# Для Ubuntu/Debian
sudo apt update && sudo apt install -y docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER  # Добавляем текущего пользователя в группу docker
newgrp docker                  # Применяем изменения без перезагрузки

# Проверка
docker --version
```

---

## **2. Создание проекта**
### **2.1. Создаем директорию и файлы**
```
mkdir my-docker-project && cd my-docker-project
echo "<h1>Мой первый Docker-образ!</h1>" > index.html
```

### **2.2. Создаем `Dockerfile`**
```
nano Dockerfile
```
**Содержимое**:
```
# Базовый образ
FROM nginx:alpine

# Копируем HTML-файл в контейнер
COPY index.html /usr/share/nginx/html

# Открываем порт 80
EXPOSE 80

# Команда для запуска (уже прописана в nginx:alpine)
CMD ["nginx", "-g", "daemon off;"]
```

---

## **3. Сборка образа**
### **3.1. Запускаем сборку**
```
docker build -t my-nginx-image .
```
**Разбор команды**:  
- `-t my-nginx-image` — имя образа.  
- `.` — путь к `Dockerfile` (текущая директория).  

### **3.2. Проверяем образ**
```
docker images
```
Вывод должен содержать:  
```
REPOSITORY       TAG       IMAGE ID       CREATED         SIZE
my-nginx-image   latest    a1b2c3d4e5f6   2 minutes ago   23.5MB
```

---

## **4. Запуск контейнера**
### **4.1. Запускаем контейнер**
```
docker run -d -p 8080:80 --name my-nginx-container my-nginx-image
```
**Разбор команды**:  
- `-d` — запуск в фоне (detached mode).  
- `-p 8080:80` — проброс порта (хост:контейнер).  
- `--name` — имя контейнера.  

### **4.2. Проверяем работу**
Откройте в браузере:  
```
http://localhost:8080
```
Или через curl:  
```
curl http://localhost:8080
```
Вывод:  
```
<h1>Мой первый Docker-образ!</h1>
```

---

## **5. Дополнительные команды**
### **5.1. Просмотр логов**
```
docker logs my-nginx-container
```

### **5.2. Вход в контейнер**
```
docker exec -it my-nginx-container sh
```
Проверьте файлы:  
```
ls /usr/share/nginx/html
cat /usr/share/nginx/html/index.html
```

### **5.3. Остановка и удаление**
```
docker stop my-nginx-container  # Остановка
docker rm my-nginx-container    # Удаление
docker rmi my-nginx-image       # Удаление образа
```

---

## **Итог**
Вы создали Docker-образ с Nginx и кастомной страницей.  
**Что можно улучшить**:  
- Добавить CSS/JS через `COPY`.  
- Настроить Nginx-конфиг (`COPY nginx.conf /etc/nginx/conf.d/default.conf`).  
- Разместить образ в Docker Hub (см. [официальную документацию](https://docs.docker.com/get-started/04_sharing_app/)).  

Для более сложных примеров (Python, PHP, БД) — спрашивайте!
