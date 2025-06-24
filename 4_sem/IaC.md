# Инструкция по настройке двух ВМ с CentOS 7.9 и Ansible

## 1. Infrastructure as Code (IaC) - краткое объяснение

Infrastructure as Code (IaC) - это подход к управлению и предоставлению инфраструктуры с помощью кода, а не ручных процессов. IaC позволяет:
- Автоматизировать развертывание инфраструктуры
- Обеспечивать идентичность сред
- Упрощать масштабирование
- Контролировать версионность инфраструктуры
- Уменьшать человеческие ошибки

## 2. Создание двух виртуальных машин на базе CentOS 7.9

### Варианты создания ВМ:
1. **Вручную** (например, в VirtualBox или VMware):
   - Скачайте образ CentOS 7.9 с официального сайта
   - Создайте 2 виртуальные машины с минимальными требованиями:
     - 1-2 CPU
     - 1-2 GB RAM
     - 10-20 GB HDD
   - Установите CentOS 7.9 на обе машины

2. **С использованием облачных провайдеров** (AWS, GCP, Azure):
   - Используйте готовый образ CentOS 7.9
   - Запустите 2 инстанса

3. **С помощью инструментов IaC** (Terraform, Vagrant):
   - Напишите конфигурацию для автоматического развертывания

## 3. Настройка ВМ и установка Ansible

### На обеих ВМ выполните:

1. Обновите систему:
   ```bash
   sudo yum update -y
   ```

2. Установите EPEL репозиторий:
   ```bash
   sudo yum install epel-release -y
   ```

3. Установите Python (если не установлен):
   ```bash
   sudo yum install python -y
   ```

4. Установите Ansible (на одной ВМ, которая будет control node):
   ```bash
   sudo yum install ansible -y
   ```

5. Установите SSH-сервер (если не установлен):
   ```bash
   sudo yum install openssh-server -y
   sudo systemctl enable sshd
   sudo systemctl start sshd
   ```

6. Настройте SSH-ключи для беспарольного доступа с control node на managed node:
   - На control node сгенерируйте ключ:
     ```bash
     ssh-keygen
     ```
   - Скопируйте ключ на managed node (замените `username` и `managed_node_ip`):
     ```bash
     ssh-copy-id username@managed_node_ip
     ```

## 4. Настройка инвентаря Ansible

На control node создайте файл инвентаря `/etc/ansible/hosts` или в домашней директории `~/ansible_hosts`:

```ini
[servers]
server1 ansible_host=<IP_адрес_первой_ВМ>
server2 ansible_host=<IP_адрес_второй_ВМ>

[all:vars]
ansible_user=<username>
ansible_ssh_private_key_file=~/.ssh/id_rsa
ansible_python_interpreter=/usr/bin/python
```

Проверьте подключение:
```bash
ansible all -m ping -i ~/ansible_hosts
```

## 5. Создание Ansible Playbook

Создайте файл `setup_servers.yml` со следующим содержимым:

```yaml
---
- name: Configure servers
  hosts: all
  become: yes
  tasks:
    - name: Create two directories
      file:
        path: "{{ item }}"
        state: directory
        mode: '0755'
      loop:
        - /opt/app_data
        - /opt/app_logs

    - name: Create user
      user:
        name: appuser
        comment: "Application User"
        home: /home/appuser
        shell: /bin/bash
        create_home: yes

    - name: Install packages
      yum:
        name: "{{ item }}"
        state: present
      loop:
        - vim
        - mc
```

## 6. Запуск Playbook

Выполните команду для запуска playbook:
```bash
ansible-playbook -i ~/ansible_hosts setup_servers.yml
```

## 7. Проверка результатов

Проверить, что все выполнено корректно:
1. Подключитесь к каждой ВМ по SSH
2. Проверьте:
   - Существование папок `/opt/app_data` и `/opt/app_logs`
   - Наличие пользователя `appuser` (`id appuser`)
   - Установленные пакеты (`rpm -qa | grep vim`, `rpm -qa | grep mc`)

## Дополнительные улучшения

1. **Использование ролей**: Для более сложных конфигураций можно организовать код в роли
2. **Шифрование секретов**: Использовать ansible-vault для защиты чувствительных данных
3. **Тестирование**: Добавить тесты с помощью molecule
4. **CI/CD**: Интегрировать выполнение playbook в pipeline CI/CD

## Пример команды для проверки отдельных задач

```bash
# Проверить создание папок
ansible all -m command -a "ls -ld /opt/app_data /opt/app_logs" -i ~/ansible_hosts

# Проверить пользователя
ansible all -m command -a "id appuser" -i ~/ansible_hosts

# Проверить установленные пакеты
ansible all -m command -a "rpm -qa | grep -E 'vim|mc'" -i ~/ansible_hosts
```