### **Команды и последовательность выполнения заданий**

---

#### **Задание 1: Работа с пользователями и группами**

1. **Создание пользователей и групп:**
   ```bash
   sudo useradd user-client2
   sudo useradd user-client3
   sudo groupadd users2
   sudo groupadd users3
   ```
   **Скриншот:** После выполнения команд, сделайте скриншот вывода `tail -n 5 /etc/passwd` и `tail -n 5 /etc/group`.

2. **Добавление пользователей в группы:**
   ```bash
   sudo usermod -aG users2 user-client3
   sudo usermod -aG users2 user-client
   sudo usermod -aG users3 user-client2
   sudo usermod -aG users3 root
   ```
   **Скриншот:** Вывод `groups user-client3` и `groups user-client2`.

3. **Назначение администратора и пароля:**
   ```bash
   sudo gpasswd -A user-client3 users2
   sudo gpasswd users3
   ```
   **Скриншот:** Введите пароль для группы `users3` и зафиксируйте это.

4. **Изменение идентификатора группы и командного интерпретатора:**
   ```bash
   sudo groupmod -g 122 users2
   sudo usermod -s /bin/dash user-client2
   ```
   **Скриншот:** Вывод `getent group users2` и `grep user-client2 /etc/passwd`.

5. **Временная регистрация как user-client3:**
   ```bash
   su - user-client3
   ```
   **Скриншот:** Вывод `whoami` и `groups`.

---

#### **Задание 2: Работа с группой file и правами**

1. **Создание группы и добавление root:**
   ```bash
   sudo groupadd file
   sudo gpasswd -A root file
   sudo gpasswd file
   ```
   **Скриншот:** Вывод `getent group file`.

2. **Создание пользователя и добавление в группу:**
   ```bash
   sudo useradd user-client2
   sudo passwd user-client2
   sudo usermod -aG file user-client
   sudo usermod -aG file user-client2
   ```
   **Скриншот:** Введите пароль `userclient2` и зафиксируйте.

3. **Изменение владельца файла:**
   ```bash
   sudo chown user-client2:file /root/grep/pay
   ```
   **Скриншот:** Вывод `ls -l /root/grep/pay`.

---

#### **Задание 3: Работа с файлами и правами**

1. **Перенаправление информации о файлах устройств:**
   ```bash
   ls -l /dev > /boot/new
   mkdir /boot/devdir
   grep '^tty' /boot/new >> /var/log/messages
   cp /var/log/messages /boot/devdir/
   ```
   **Скриншот:** Вывод `ls -l /boot/devdir`.

2. **Изменение прав доступа:**
   ```bash
   chmod 720 /boot/devdir/messages
   ls -l /boot/devdir/messages
   ```
   **Скриншот:** Вывод `ls -l /boot/devdir/messages`.

---

#### **Задание 4: Работа с директорией owner**

1. **Создание директории и копирование файла:**
   ```bash
   mkdir /boot/owner
   cp /etc/fstab /boot/owner/
   ```
   **Скриншот:** Вывод `ls -l /boot/owner`.

2. **Изменение владельца и прав:**
   ```bash
   sudo chown user-client /boot/owner/mtab
   sudo chmod 421 /boot/owner/fstab
   sudo setfacl -m u:daemon:rw- /boot/owner/fstab
   getfacl /boot/owner/mtab
   ```
   **Скриншот:** Вывод `getfacl /boot/owner/mtab` и `ls -l /boot/owner/fstab`.

---

#### **Задание 5: Поиск файлов и изменение атрибутов**

1. **Поиск файлов:**
   ```bash
   sudo find / -user bind -group bind -exec cp {} /home/user-client \;
   ```
   **Скриншот:** Вывод `ls -l /home/user-client`.

2. **Изменение владельца и атрибутов:**
   ```bash
   sudo chown u-c-2 /home/user-client/*
   sudo setfacl -m u:user-client:-wx,u:u-c-3:r-x /home/user-client/*
   getfacl /home/user-client/*
   ```
   **Скриншот:** Вывод `getfacl /home/user-client/*`.

---

#### **Вопрос 1: Утилиты мониторинга**

1. **Выполнение команд:**
   ```bash
   df
   df -h
   df -a
   df -x tmpfs
   df -t ext4
   df -h /home
   du
   du -a ~/Documents
   sudo du -h /var
   free
   free -s 5
   free -h --si -s 5 -c 4
   iostat
   mpstat -A
   mpstat -P ALL
   mpstat -P 0
   vmstat
   htop
   ```
   **Скриншоты:** Для каждой команды сделайте отдельный скриншот вывода.

---

#### **Вопрос 2: Запуск программ по расписанию**

1. **Просмотр сценариев cron:**
   ```bash
   ls /etc/cron.*
   ```
   **Скриншот:** Вывод `ls /etc/cron.*`.

2. **Тестирование сценариев:**
   ```bash
   run-parts --test /etc/cron.weekly
   run-parts -v /etc/cron.daily
   ```
   **Скриншоты:** Вывод `run-parts --test /etc/cron.weekly` и завершение `run-parts -v /etc/cron.daily`.

---

### **Итоговые рекомендации:**
- Сохраняйте скриншоты после каждого этапа выполнения команд.
- В отчет включите текстовое описание, синтаксис команд и соответствующие скриншоты.
- Убедитесь, что все команды выполняются от имени указанного пользователя (`user-client` или `sa@<Фамилия>`).