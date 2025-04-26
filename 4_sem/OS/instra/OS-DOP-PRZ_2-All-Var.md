### **Решение для Вопроса 3 (все варианты)**
**Путь к файлам:** `/home/user-X-XX/text{1..4}.txt`  
*(Замените `X-XX` на вашу фамилию и номер, например, `/home/user-ivanov-15/`)*  

---

### **Общие команды для подготовки**
Перед выполнением заданий создайте файлы и заполните их тестовыми данными:
```bash
sudo mkdir -p /home/user-X-XX
cd /home/user-X-XX
sudo touch text{1..4}.txt 
```

---

### **Команды для каждого варианта**

#### **Вариант 1**
```bash
# 1. Имя начинается на 'R'
grep -E " R\." /home/user-X-XX/text1.txt

# 2. 'TENNIS' и цена 1990 г.
grep "TENNIS.*1990" /home/user-X-XX/text3.txt

# 3. Фамилия 'DUNCAN'
grep "DUNCAN" /home/user-X-XX/text4.txt
```

#### **Вариант 2**
```bash
# 1. Код покупателя 201
grep "201" /home/user-X-XX/text4.txt

# 2. Индекс начинается с '11'
grep -E " 11[0-9]*" /home/user-X-XX/text2.txt

# 3. Минимальная цена ≥10
grep -E "min:[1-9][0-9]|min:10" /home/user-X-XX/text3.txt
```

#### **Вариант 3**
```bash
# 1. Фамилия начинается на 'M'
grep -E " M[^ ]+" /home/user-X-XX/text1.txt

# 2. Сумма без копеек (целое число)
grep -E " [0-9]+\.00" /home/user-X-XX/text4.txt

# 3. min_price <10, max_price ≥10
grep -E "min:[0-9].*max:1[0-9]" /home/user-X-XX/text3.txt
```

#### **Вариант 4**
```bash
# 1. Фамилия заканчивается на 'N'
grep -E " N[^ ]*$" /home/user-X-XX/text4.txt

# 2. Должность 'MANAGER', отдел 'SALES'
grep -i "manager.*sales" /home/user-X-XX/text1.txt

# 3. Максимальная цена ≥20
grep -E "max:2[0-9]|max:[3-9][0-9]" /home/user-X-XX/text3.txt
```

#### **Вариант 5**
```bash
# 1. Код заканчивается на '69'
grep -E "69[^0-9]?$" /home/user-X-XX/text1.txt

# 2. Название содержит 'SPORT'
grep -i "sport" /home/user-X-XX/text2.txt

# 3. Сумма: 1000 ≤ X <2000
grep -E " 1[0-9]{3}\." /home/user-X-XX/text4.txt
```

#### **Вариант 6**
```bash
# 1. Код заканчивается на '1'
grep -E "1[^0-9]?$" /home/user-X-XX/text3.txt

# 2. Адрес: номер дома '2'
grep -E " 2[^0-9]" /home/user-X-XX/text2.txt

# 3. Кредит ≥10000
grep -E " [1-9][0-9]{4,}" /home/user-X-XX/text2.txt
```

#### **Вариант 7**
```bash
# 1. Код заканчивается на '8'
grep -E "8[^0-9]?$" /home/user-X-XX/text2.txt

# 2. Номер заказа не содержит '4'
grep -v "4" /home/user-X-XX/text4.txt | grep "ORDER"

# 3. Зарплата <1000
grep -E " [0-9]{3}\." /home/user-X-XX/text1.txt
```

#### **Вариант 8**
```bash
# 1. Инициалы 'K.J.'
grep -E " K\..* J\." /home/user-X-XX/text1.txt

# 2. min_price=15, max_price=20
grep -E "min:15.*max:20|max:20.*min:15" /home/user-X-XX/text3.txt

# 3. Должность 'MANAGER', город 'NEW YORK'
grep -i "manager.*new york" /home/user-X-XX/text1.txt
```

#### **Вариант 9**
```bash
# 1. Номер заказа заканчивается на '4'
grep -E "4[^0-9]?$" /home/user-X-XX/text4.txt

# 2. 'TENNIS' и цена 1990 г.
grep "TENNIS.*1990" /home/user-X-XX/text3.txt

# 3. Номер дома ≥1000
grep -E " [1-9][0-9]{3}[^0-9]" /home/user-X-XX/text2.txt
```

#### **Вариант 10**
```bash
# 1. Средний инициал 'M'
grep -E " \w\.M\." /home/user-X-XX/text1.txt

# 2. Цена установлена в январе или феврале
grep -E " (01|02)\.[0-9]{2}\." /home/user-X-XX/text3.txt

# 3. Сумма ≥10000
grep -E " [1-9][0-9]{4,}\." /home/user-X-XX/text4.txt
```

#### **Вариант 11**
```bash
# 1. Штат 'MA'
grep -E " MA[^A-Z]" /home/user-X-XX/text2.txt

# 2. Код с двумя или более '0' подряд
grep -E "0{2,}" /home/user-X-XX/text3.txt

# 3. Фамилия на 'M', зарплата <1000
grep -E " M[^ ]+.* [0-9]{3}\." /home/user-X-XX/text1.txt
```

#### **Вариант 12**
```bash
# 1. Город 'DALLAS'
grep -i "dallas" /home/user-X-XX/text2.txt

# 2. Код начинается с '5', сумма с копейками
grep -E "5[0-9]*.* [0-9]+\.[0-9]{2}" /home/user-X-XX/text4.txt

# 3. Зарплата 2000–2999
grep -E " 2[0-9]{3}\." /home/user-X-XX/text1.txt
```

#### **Вариант 13**
```bash
# 1. Город не 'NEW YORK'
grep -iv "new york" /home/user-X-XX/text1.txt

# 2. Цена 1990 г.
grep "1990" /home/user-X-XX/text3.txt

# 3. Название улицы с цифрами
grep "[0-9]" /home/user-X-XX/text2.txt
```

#### **Вариант 14**
```bash
# 1. Латинские цифры (IV, X)
grep -E " IV| IX|VI|XI|XII" /home/user-X-XX/text3.txt

# 2. Дата продажи — 1-е число
grep -E " 01\.[0-9]{2}\.| 1\.[0-9]{2}\." /home/user-X-XX/text4.txt

# 3. Должность не 'SALESPERSON'
grep -iv "salesperson" /home/user-X-XX/text1.txt
```

#### **Вариант 15**
```bash
# 1. Телефон начинается с '555'
grep -E "^555" /home/user-X-XX/text2.txt

# 2. Название с кавычками и словом 'GUIDE'
grep -E "\".*GUIDE.*\"" /home/user-X-XX/text3.txt

# 3. Сумма — целые сотни (100, 200)
grep -E " [0-9]+00\.[0-9]{2}" /home/user-X-XX/text4.txt
```

---

### **Примечания**
**Некоторые значения в файлах отличаются от значений в командах. К примеру "1990" может быть в файле как "90".**