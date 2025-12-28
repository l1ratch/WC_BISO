# ОТВЕТЫ НА ВОПРОСЫ К ЗАЧЕТУ
**Технологии и методы программирования**  
**Преподаватель:** Новиков Евгений Иванович

---

## ВОПРОС 1. Типы данных языка Python

**Классификация:**
- **Скалярные** (одно значение): int, float, str, bool, NoneType
- **Составные** (множество значений): list, tuple, dict, set

**Изменяемые:** list, dict, set, объекты классов  
**Неизменяемые:** int, float, str, bool, tuple, frozenset

**Приведение типов:**
```python
int("42")      # 42
float("3.14")  # 3.14
str(100)       # "100"
bool(1)        # True
```

---

## ВОПРОС 2. Операции над скалярными типами данных

**Арифметические:** `+`, `-`, `*`, `/`, `//`, `%`, `**`

**Сравнения:** `==`, `!=`, `>`, `<`, `>=`, `<=`

**Логические:** `and`, `or`, `not`

**Приоритеты (от высшего к низшему):**
1. `**`
2. `*`, `/`, `//`, `%`
3. `+`, `-`
4. `>`, `<`, `>=`, `<=`, `==`, `!=`
5. `not`
6. `and`
7. `or`

---

## ВОПРОС 3. Функции ввода и вывода

**Вывод:**
```python
print("Hello", x, y)           # вывод
print(x, end='')               # без новой строки
print(x, sep=', ')             # разделитель
```

**Форматирование:**
```python
"Привет, %s" % name                    # оператор %
"Число: {}".format(42)                 # метод format()
f"Имя: {name}, возраст: {age}"        # f-строки
```

**Ввод:**
```python
x = input("Введите: ")        # всегда строка
age = int(input("Возраст: ")) # преобразование
```

---

## ВОПРОС 4. Оператор присваивания

**Простое:**
```python
x = 5
name = "Иван"
```

**Множественное:**
```python
x = y = z = 0              # всем одно значение
a, b, c = 1, 2, 3          # распаковка
x, y = y, x                # обмен значений
```

---

## ВОПРОС 5. Условный оператор

**Полный:**
```python
if x > 0:
    print("Положительное")
elif x < 0:
    print("Отрицательное")
else:
    print("Ноль")
```

**Неполный:**
```python
if x > 0:
    print("Положительное")
```

**Тернарный:**
```python
result = "Да" if x > 10 else "Нет"
```

---

## ВОПРОС 6. Условные операторы (множественный выбор, вложенные)

**Множественный выбор:**
```python
if score >= 90:
    grade = 'A'
elif score >= 80:
    grade = 'B'
elif score >= 70:
    grade = 'C'
else:
    grade = 'F'
```

**Вложенные:**
```python
if x > 0:
    if x < 10:
        print("От 1 до 9")
    else:
        print("10 или больше")
else:
    print("Отрицательное или ноль")
```

---

## ВОПРОС 7. Цикл while, break, continue

**Цикл с условием:**
```python
i = 0
while i < 5:
    print(i)
    i += 1
```

**break - выход из цикла:**
```python
while True:
    cmd = input(">> ")
    if cmd == "exit":
        break
```

**continue - следующая итерация:**
```python
i = 0
while i < 10:
    i += 1
    if i % 2 == 0:
        continue
    print(i)  # только нечетные
```

---

## ВОПРОС 8. Цикл for, функция range()

**Цикл с итератором:**
```python
for i in range(5):
    print(i)  # 0, 1, 2, 3, 4

for letter in "hello":
    print(letter)
```

**Функция range():**
```python
range(5)           # 0, 1, 2, 3, 4
range(2, 7)        # 2, 3, 4, 5, 6
range(1, 10, 2)    # 1, 3, 5, 7, 9
range(10, 0, -1)   # 10, 9, 8, ..., 1
```

---

## ВОПРОС 9. Списки - функции, методы, операторы

**Функции:**
```python
len(lst)          # длина
max(lst)          # максимум
min(lst)          # минимум
sum(lst)          # сумма
sorted(lst)       # отсортированный список
```

**Методы:**
```python
lst.append(x)     # добавить
lst.insert(i, x)  # вставить
lst.remove(x)     # удалить элемент
lst.pop()         # удалить и вернуть
lst.index(x)      # индекс элемента
lst.count(x)      # количество вхождений
lst.sort()        # сортировать на месте
lst.reverse()     # перевернуть
```

**Операторы:**
```python
lst[0]            # индексация
lst[1:3]          # срез
lst + lst2        # конкатенация
lst * 3           # повторение
x in lst          # проверка наличия
```

---

## ВОПРОС 10. Создание списков, списковые включения

**Создание:**
```python
lst = [1, 2, 3, 4, 5]
lst = []
lst = list(range(10))
lst = [0] * 5
```

**Списковые включения:**
```python
[x * 2 for x in range(5)]              # [0, 2, 4, 6, 8]
[x for x in range(10) if x % 2 == 0]   # [0, 2, 4, 6, 8]
[x**2 for x in range(1, 6)]            # [1, 4, 9, 16, 25]
[[i, j] for i in range(3) for j in range(2)]  # вложенное
```

---

## ВОПРОС 11. Методы работы с элементами списка

**Добавление:**
```python
lst.append(6)              # в конец
lst.insert(1, 99)          # на позицию 1
lst.extend([7, 8, 9])      # несколько элементов
```

**Удаление:**
```python
lst.remove(99)             # первое вхождение
del lst[0]                 # по индексу
lst.pop()                  # последний элемент
lst.pop(2)                 # по индексу
lst.clear()                # очистить
```

**Поиск:**
```python
lst.index(5)               # индекс элемента
lst.count(5)               # количество вхождений
5 in lst                   # проверка наличия
```

---

## ВОПРОС 12. Операции со списками

**Поиск минимума/максимума:**
```python
min(lst)                   # минимальный
max(lst)                   # максимальный
lst.index(min(lst))        # индекс минимума
lst.index(max(lst))        # индекс максимума
```

**Количество элементов:**
```python
len(lst)                   # длина
```

**Сумма и произведение:**
```python
sum(lst)                   # сумма
import math
math.prod(lst)             # произведение (Python 3.8+)
```

---

## ВОПРОС 13. Срезы списков

```python
lst = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

lst[2:5]          # [2, 3, 4] - с индекса 2 до 4
lst[:5]           # [0, 1, 2, 3, 4] - с начала до 4
lst[5:]           # [5, 6, 7, 8, 9] - с 5 до конца
lst[::2]          # [0, 2, 4, 6, 8] - каждый второй
lst[::-1]         # [9, 8, 7, ..., 0] - обратный порядок
lst[-3:]          # [7, 8, 9] - последние 3
lst[:-3]          # [0, 1, ..., 6] - все кроме последних 3
```

---

## ВОПРОС 14. Кортежи

**Создание:**
```python
tpl = (1, 2, 3)
tpl = 1, 2, 3              # без скобок
tpl = (1,)                 # один элемент
tpl = ()                   # пустой
```

**Функции:**
```python
len(tpl)                   # длина
max(tpl), min(tpl)         # макс/мин
tpl.count(x)               # количество
tpl.index(x)               # индекс
```

**Операторы:**
```python
tpl[0]                     # индексация
tpl[1:3]                   # срез
tpl1 + tpl2                # конкатенация
tpl * 3                    # повторение
x in tpl                   # проверка
```

**Распаковка:**
```python
a, b, c = (1, 2, 3)
a, *rest = (1, 2, 3, 4)    # rest = [2, 3, 4]
```

---

## ВОПРОС 15. Словари

**Создание:**
```python
d = {'a': 1, 'b': 2, 'c': 3}
d = dict(a=1, b=2, c=3)
d = dict([('a', 1), ('b', 2)])
d = {}                     # пустой
```

**Ключи и значения:**
```python
d['a']                     # получить значение
d['a'] = 10                # установить
d['d'] = 4                 # добавить новую пару
del d['a']                 # удалить
```

**Методы:**
```python
d.keys()                   # все ключи
d.values()                 # все значения
d.items()                  # пары (ключ, значение)
d.get('a', default)        # с default значением
d.pop('a')                 # удалить и вернуть
d.update({'e': 5})         # добавить/обновить
d.clear()                  # очистить
```

**Функции:**
```python
len(d)                     # количество пар
'a' in d                   # проверка ключа
```

---

## ВОПРОС 16. Множества

**Создание:**
```python
s = {1, 2, 3, 4, 5}
s = set([1, 2, 3])
s = set()                  # пустое
```

**Методы:**
```python
s.add(6)                   # добавить
s.remove(1)                # удалить (ошибка если нет)
s.discard(1)               # удалить (без ошибки)
s.clear()                  # очистить
```

**Операции:**
```python
s1 | s2                    # объединение
s1 & s2                    # пересечение
s1 - s2                    # разность
s1 ^ s2                    # симметричная разность

s1.union(s2)
s1.intersection(s2)
s1.difference(s2)
s1.symmetric_difference(s2)
```

**Проверки:**
```python
len(s)                     # размер
x in s                     # принадлежность
s1.issubset(s2)           # подмножество?
s1.issuperset(s2)         # надмножество?
```

---

## ВОПРОС 17. Строки

**Создание:**
```python
s = "hello"
s = 'world'
s = """многострочная"""
```

**Методы:**
```python
s.upper()                  # HELLO
s.lower()                  # hello
s.capitalize()             # Hello
s.strip()                  # убрать пробелы
s.split()                  # разделить на слова
','.join(['a', 'b'])       # объединить
s.replace('old', 'new')    # замена
s.find('sub')              # индекс подстроки (-1 если нет)
s.count('a')               # количество вхождений
s.startswith('h')          # начинается с
s.endswith('o')            # заканчивается на
```

**Проверки:**
```python
s.isdigit()                # только цифры
s.isalpha()                # только буквы
s.isalnum()                # буквы и цифры
s.isspace()                # только пробелы
```

**Срезы:**
```python
s[0]                       # первый символ
s[-1]                      # последний
s[1:4]                     # подстрока
s[::-1]                    # обратный порядок
```

---

## ВОПРОС 18. Функции

**Создание:**
```python
def func_name(param1, param2):
    """Документация"""
    result = param1 + param2
    return result
```

**Аргументы:**
```python
def func(a, b=10):         # b по умолчанию
    return a + b

def func(*args):           # переменное кол-во позиционных
    return sum(args)

def func(**kwargs):        # переменное кол-во именованных
    return kwargs

def func(a, *args, **kwargs):  # комбинация
    pass
```

**Возвращаемое значение:**
```python
def func():
    return 5               # одно значение

def func():
    return 1, 2, 3         # кортеж

def func():
    pass                   # None
```

---

## ВОПРОС 19. Итераторы и генераторы

**Итератор:**
- Объект с методами `__iter__()` и `__next__()`
- Возвращает следующий элемент

```python
it = iter([1, 2, 3])
next(it)                   # 1
next(it)                   # 2
```

**Генератор:**
- Функция с `yield` вместо `return`
- Создает итератор

```python
def my_gen():
    yield 1
    yield 2
    yield 3

for x in my_gen():
    print(x)
```

**Отличия:**
- Генератор - частный случай итератора
- Генератор создается функцией с yield
- Итератор может быть создан классом

---

## ВОПРОС 20. Лямбда-функции

**Определение:**
```python
lambda аргументы: выражение
```

**Примеры:**
```python
f = lambda x: x * 2
f(5)                       # 10

f = lambda x, y: x + y
f(3, 4)                    # 7

f = lambda x: x if x > 0 else -x
```

**Отличия от обычных функций:**
- Анонимные (без имени)
- Только одно выражение
- Нет инструкций (if/for как операторы)
- Компактны, но менее читаемы

**Применение:**
```python
sorted(lst, key=lambda x: x[1])
list(map(lambda x: x * 2, numbers))
list(filter(lambda x: x > 0, numbers))
```

---

## ВОПРОС 21. Модули и пакеты

**Модуль:**
- Файл .py с кодом Python
- Переиспользуемый код

**Импорт модулей:**
```python
import модуль
import модуль as alias
from модуль import имя
from модуль import *
```

**Пакет:**
- Директория с модулями
- Содержит `__init__.py`

**Структура:**
```
mypackage/
    __init__.py
    module1.py
    module2.py
    subpackage/
        __init__.py
        module3.py
```

**Импорт пакетов:**
```python
import mypackage.module1
from mypackage import module1
from mypackage.subpackage import module3
```

**Инициализатор `__init__.py`:**
- Выполняется при импорте
- Может содержать инициализацию
- Определяет `__all__` для контроля импорта

---

## ВОПРОС 22. Работа с файлами

**Функция open():**
```python
f = open('file.txt', 'r')  # чтение
f = open('file.txt', 'w')  # запись
f = open('file.txt', 'a')  # добавление
f = open('file.txt', 'rb') # бинарное чтение
```

**Чтение:**
```python
content = f.read()         # весь файл
line = f.readline()        # одна строка
lines = f.readlines()      # список строк
```

**Запись:**
```python
f.write("текст")           # строка
f.writelines(lines)        # список строк
```

**Работа с контекстом:**
```python
with open('file.txt', 'r') as f:
    content = f.read()
# файл закрывается автоматически

with open('file.txt', 'r') as f:
    for line in f:
        print(line.strip())
```

---

## ВОПРОС 23. Функции map и filter

**map():**
```python
map(функция, последовательность)

numbers = [1, 2, 3, 4, 5]
doubled = list(map(lambda x: x * 2, numbers))
# [2, 4, 6, 8, 10]

strings = list(map(str, [1, 2, 3]))
# ['1', '2', '3']
```

**filter():**
```python
filter(функция, последовательность)

evens = list(filter(lambda x: x % 2 == 0, numbers))
# [2, 4]
```

**Совместная работа:**
```python
# Удвоить четные числа
result = list(map(
    lambda x: x * 2,
    filter(lambda x: x % 2 == 0, [1, 2, 3, 4, 5, 6])
))
# [4, 8, 12]
```

---

## ВОПРОС 24. Функции all и any

**all():**
```python
all([True, True, True])    # True - все True
all([True, False, True])   # False - есть False
all([1, 2, 3])             # True - все не 0
all([1, 0, 3])             # False - есть 0
```

**any():**
```python
any([False, False, True])  # True - хотя бы один True
any([False, False, False]) # False - все False
any([0, 0, 1])             # True - есть не 0
```

**С map():**
```python
numbers = [1, 2, 3, 4, 5]

# Все положительные?
all(map(lambda x: x > 0, numbers))  # True

# Есть четные?
any(map(lambda x: x % 2 == 0, numbers))  # True
```

---

## ВОПРОС 25. sort и sorted

**sorted():**
```python
sorted(lst)                    # новый список
sorted(lst, reverse=True)      # по убыванию

# С параметром key
sorted(students, key=lambda x: x[1])  # по второму элементу
sorted(words, key=len)         # по длине
```

**sort():**
```python
lst.sort()                     # сортирует на месте
lst.sort(reverse=True)
lst.sort(key=lambda x: x)
```

**Отличия:**
- `sorted()` - возвращает новый список, работает с любой последовательностью
- `sort()` - изменяет список на месте, возвращает None, только для списков

**Параметр key:**
```python
# Сортировка по длине строки
sorted(['apple', 'pie', 'x'], key=len)  # ['x', 'pie', 'apple']

# Сортировка кортежей
sorted([(1, 2), (3, 1), (5, 0)], key=lambda x: x[1])
```

---

## ВОПРОС 26. Функция zip

**Определение:**
```python
zip(*последовательности)
```

**С коллекциями:**
```python
list1 = [1, 2, 3]
list2 = ['a', 'b', 'c']
list(zip(list1, list2))
# [(1, 'a'), (2, 'b'), (3, 'c')]

# Создание словаря
dict(zip(['a', 'b', 'c'], [1, 2, 3]))
# {'a': 1, 'b': 2, 'c': 3}
```

**С двумерными коллекциями:**
```python
# Транспонирование матрицы
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
transposed = list(zip(*matrix))
# [(1, 4, 7), (2, 5, 8), (3, 6, 9)]

# Или в виде списков
transposed = [list(row) for row in zip(*matrix)]
# [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
```

**Разная длина:**
```python
list1 = [1, 2, 3, 4]
list2 = ['a', 'b']
list(zip(list1, list2))  # [(1, 'a'), (2, 'b')] - по меньшему
```

---

## ВОПРОС 27. Назначение и характеристики NumPy

**Назначение:**
- Библиотека для работы с числовыми массивами
- Основа для научных вычислений

**Преимущества:**
- Скорость (написана на C/Fortran)
- Векторизация операций
- Удобство работы с матрицами
- Большой набор математических функций
- Основа для Pandas, SciPy, Scikit-learn

**Ограничения:**
- Все элементы одного типа
- Фиксированный размер (нет динамического роста)
- Больше памяти для малых данных

```python
import numpy as np
```

---

## ВОПРОС 28. Массивы в NumPy и способы создания

**Определение:**
- Массив - однородная структура данных фиксированного размера

**Создание:**
```python
# Из списка
a = np.array([1, 2, 3, 4, 5])
m = np.array([[1, 2, 3], [4, 5, 6]])

# Нули и единицы
np.zeros(5)                # [0. 0. 0. 0. 0.]
np.ones((3, 3))            # матрица 3x3 единиц
np.eye(3)                  # единичная матрица

# Диапазоны
np.arange(10)              # [0 1 2 ... 9]
np.arange(2, 8, 0.5)       # с шагом
np.linspace(0, 1, 5)       # 5 точек от 0 до 1

# Случайные
np.random.rand(5)          # от 0 до 1
np.random.randn(5)         # нормальное распределение
np.random.randint(0, 10, 5)  # целые от 0 до 9

# Пустой
np.empty(5)
```

---

## ВОПРОС 29. Типы данных в NumPy

**Целые:**
```python
int8, int16, int32, int64
uint8, uint16, uint32, uint64  # беззнаковые
```

**Вещественные:**
```python
float32, float64
```

**Комплексные:**
```python
complex64, complex128
```

**Другие:**
```python
bool_                      # логические
object_                    # объекты Python
string_                    # строки
```

**Определение и изменение:**
```python
a = np.array([1, 2, 3], dtype=np.int32)
a.dtype                    # int32

b = a.astype(np.float64)   # преобразование
```

---

## ВОПРОС 30. Свойства массива NumPy

```python
a = np.array([[1, 2, 3], [4, 5, 6]])

a.shape          # (2, 3) - размеры (строки, столбцы)
a.ndim           # 2 - количество осей (размерностей)
a.size           # 6 - общее количество элементов
a.dtype          # int64 - тип данных
a.itemsize       # 8 - размер одного элемента в байтах
a.nbytes         # 48 - общий размер в байтах
a.T              # транспонированная матрица
```

---

## ВОПРОС 31. Индексация и итерирование

**Индексация:**
```python
a = np.array([0, 1, 2, 3, 4, 5])
a[0]                       # 0
a[-1]                      # 5
a[2:5]                     # [2 3 4]
a[::2]                     # [0 2 4]

# Многомерные
m = np.array([[1, 2, 3], [4, 5, 6]])
m[0, 1]                    # 2 (строка 0, колонка 1)
m[1, :]                    # [4 5 6] (вся строка 1)
m[:, 1]                    # [2 5] (весь столбец 1)
```

**Итерирование:**
```python
for elem in a:
    print(elem)

for row in m:
    print(row)

for elem in m.flat:        # по всем элементам
    print(elem)
```

---

## ВОПРОС 32. Изменение формы массива

```python
a = np.arange(12)          # [0 1 2 ... 11]

# reshape - изменить форму
b = a.reshape(3, 4)        # матрица 3x4
c = a.reshape(2, 3, 2)     # 3D массив

# flatten - в одномерный (копия)
flat = b.flatten()

# ravel - в одномерный (view)
rav = b.ravel()

# transpose - транспонирование
m = np.array([[1, 2], [3, 4]])
m.T                        # [[1 3] [2 4]]
np.transpose(m)
```

---

## ВОПРОС 33. Распаковка и сортировка

**Распаковка:**
```python
a = np.array([1, 2, 3])
x, y, z = a                # x=1, y=2, z=3
```

**Сортировка:**
```python
a = np.array([3, 1, 4, 1, 5, 9])

np.sort(a)                 # новый массив [1 1 3 4 5 9]
a.sort()                   # сортировать на месте

# Индексы сортировки
np.argsort(a)              # индексы для сортированного

# По осям
m = np.array([[3, 1], [4, 2]])
np.sort(m, axis=0)         # по столбцам
np.sort(m, axis=1)         # по строкам
```

---

## ВОПРОС 34. Изменение элементов

```python
a = np.array([1, 2, 3, 4, 5])

# Простое
a[0] = 10
a[1:3] = [20, 30]

# С условиями
a[a > 3] = 0               # заменить все > 3 на 0
a[a < 3] *= 10             # умножить все < 3 на 10

# Булевая индексация
mask = a > 2
a[mask] = 99
```

---

## ВОПРОС 35. Создание копии массива

```python
a = np.array([1, 2, 3])

# Ссылка (не копия!)
b = a
b[0] = 99
print(a)                   # [99 2 3] - изменилось!

# Глубокая копия
c = a.copy()
c[0] = 99
print(a)                   # [1 2 3] - не изменилось

# View (поверхностная копия)
d = a.view()               # меняет данные, не форму
```

---

## ВОПРОС 36. Объединение и разделение массивов

**Объединение:**
```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

np.concatenate([a, b])     # [1 2 3 4 5 6]
np.hstack([a, b])          # горизонтально
np.vstack([a, b])          # вертикально [[1 2 3] [4 5 6]]

# Для матриц
m1 = np.array([[1, 2], [3, 4]])
m2 = np.array([[5, 6], [7, 8]])
np.concatenate([m1, m2], axis=0)  # по строкам
np.concatenate([m1, m2], axis=1)  # по столбцам
```

**Разделение:**
```python
a = np.arange(9)

np.split(a, 3)             # на 3 равные части
np.vsplit(m, 3)            # по строкам
np.hsplit(m, 2)            # по столбцам
```

---

## ВОПРОС 37. Векторизация и универсальные функции

**Векторизация:**
- Применение операций поэлементно ко всему массиву
- Быстрее циклов Python

```python
a = np.array([1, 2, 3, 4, 5])
b = a * 2                  # [2 4 6 8 10] - без цикла!
```

**Универсальные функции (ufuncs):**
```python
# Арифметические
np.add(a, 1)
np.subtract(a, 1)
np.multiply(a, 2)
np.divide(a, 2)

# Математические
np.sqrt(a)
np.exp(a)
np.log(a)
np.sin(a)

# Логические
np.logical_and(a > 2, a < 4)
```

**Назначение:**
- Оптимизированы на уровне C
- Работают поэлементно
- Поддерживают broadcasting

---

## ВОПРОС 38. Почему списки Python медленнее массивов NumPy?

**Причины:**

1. **Типизация:** списки хранят указатели на объекты разных типов, NumPy - однородные данные
2. **Язык:** NumPy написан на C/Fortran, списки - на Python
3. **Векторизация:** NumPy оптимизирован на уровне CPU
4. **Память:** NumPy использует непрерывные блоки памяти
5. **Интерпретатор:** циклы Python выполняются через интерпретатор

**Пример:**
```python
# Python список
lst = [x * 2 for x in range(1000000)]  # ~0.05 сек

# NumPy
arr = np.arange(1000000) * 2           # ~0.001 сек (в 50 раз быстрее)
```

---

## ВОПРОС 39. Арифметические операции над одномерными массивами

```python
a = np.array([1, 2, 3, 4])
b = np.array([4, 3, 2, 1])

# Поэлементные операции
a + b              # [5 5 5 5]
a - b              # [-3 -1 1 3]
a * b              # [4 6 6 4]
a / b              # [0.25 0.66... 1.5 4.0]
a ** 2             # [1 4 9 16]
a % 2              # [1 0 1 0]

# Со скаляром
a + 10             # [11 12 13 14]
a * 2              # [2 4 6 8]
10 / a             # [10. 5. 3.33... 2.5]
```

---

## ВОПРОС 40. Арифметические операции над двумерными массивами

```python
m1 = np.array([[1, 2], [3, 4]])
m2 = np.array([[5, 6], [7, 8]])

# Поэлементные
m1 + m2            # [[6 8] [10 12]]
m1 - m2            # [[-4 -4] [-4 -4]]
m1 * m2            # [[5 12] [21 32]] - НЕ матричное!
m1 / m2            # [[0.2 0.33...] [0.43... 0.5]]

# Матричное умножение
np.dot(m1, m2)     # [[19 22] [43 50]]
m1 @ m2            # то же самое (Python 3.5+)

# Со скаляром
m1 + 10            # [[11 12] [13 14]]
m1 * 2             # [[2 4] [6 8]]
```

---

## ВОПРОС 41. Понятие NaN в NumPy

**NaN (Not a Number):**
- Специальное значение для обозначения "не число"
- Результат неопределенных операций

```python
np.nan                     # NaN

a = np.array([1, 2, np.nan, 4, 5])

# Проверка
np.isnan(a)                # [False False True False False]

# Функции, игнорирующие NaN
np.nanmean(a)              # среднее без NaN
np.nansum(a)               # сумма без NaN
np.nanmax(a)               # максимум без NaN
np.nanmin(a)               # минимум без NaN

# Замена NaN
a[np.isnan(a)] = 0         # заменить на 0
np.nan_to_num(a)           # 0 для NaN

# Бесконечность
np.inf                     # ∞
np.isinf(a)                # проверка
```

---

## ВОПРОС 42. Трансляция (broadcasting) массивов

**Определение:**
- Механизм для работы с массивами разных форм
- Меньший массив "растягивается" к большему

**Правила:**
1. Если размерности разные, добавить 1 к меньшему
2. Массивы совместимы, если для каждой оси размеры равны или один = 1
3. Результат имеет максимальный размер по каждой оси

**Примеры:**
```python
# Скаляр и массив
a = np.array([1, 2, 3])
b = 10
a + b                      # [11 12 13]

# Вектор и матрица
m = np.array([[1, 2, 3], [4, 5, 6]])  # (2, 3)
row = np.array([1, 2, 3])              # (3,) -> (1, 3)
m + row                    # [[2 4 6] [5 7 9]]

col = np.array([[1], [2]]) # (2, 1)
m + col                    # [[2 3 4] [6 7 8]]
```

---

## ВОПРОС 43. Логические операции над массивами

```python
a = np.array([1, 2, 3, 4, 5])
b = np.array([5, 4, 3, 2, 1])

# Сравнения
a > 2                      # [False False True True True]
a == b                     # [False False True False False]
a != b                     # [True True False True True]

# Логические операции
(a > 2) & (a < 5)          # [False False True True False]
(a > 4) | (a < 2)          # [True False False False True]
~(a > 3)                   # [True True True False False]

# Функции
np.logical_and(a > 2, a < 5)
np.logical_or(a > 4, a < 2)
np.logical_not(a > 3)

# Агрегирование
np.any(a > 3)              # True - хотя бы один
np.all(a > 0)              # True - все
```

---

## ВОПРОС 44. Показательные функции и логарифмы

```python
a = np.array([1, 2, 3])

# Экспоненты
np.exp(a)                  # e^x: [2.72 7.39 20.09]
np.exp2(a)                 # 2^x: [2 4 8]
np.power(3, a)             # 3^x: [3 9 27]
a ** 2                     # x^2: [1 4 9]

# Логарифмы
np.log(a)                  # ln(x): [0. 0.69 1.1]
np.log2(a)                 # log₂(x): [0. 1. 1.58]
np.log10(a)                # log₁₀(x): [0. 0.3 0.48]

# Обратные
np.exp(np.log(a))          # вернет исходный a
```

---

## ВОПРОС 45. Функции математической статистики

```python
a = np.array([1, 2, 3, 4, 5])

# Минимум/максимум
np.min(a)                  # 1
np.max(a)                  # 5
np.argmin(a)               # 0 (индекс минимума)
np.argmax(a)               # 4 (индекс максимума)

# Сумма/произведение
np.sum(a)                  # 15
np.prod(a)                 # 120
np.cumsum(a)               # [1 3 6 10 15] - накопленная
np.cumprod(a)              # [1 2 6 24 120] - накопленное

# Среднее/медиана
np.mean(a)                 # 3.0
np.median(a)               # 3.0
np.std(a)                  # стандартное отклонение
np.var(a)                  # дисперсия

# Для матриц
m = np.array([[1, 2, 3], [4, 5, 6]])
np.mean(m, axis=0)         # по столбцам [2.5 3.5 4.5]
np.mean(m, axis=1)         # по строкам [2. 5.]
```

---

## ВОПРОС 46. Тригонометрические функции

```python
a = np.array([0, np.pi/2, np.pi])

# Основные (в радианах)
np.sin(a)                  # [0. 1. 0.]
np.cos(a)                  # [1. 0. -1.]
np.tan(a)                  # [0. ∞ 0.]

# Обратные
np.arcsin([0, 1])          # [0. π/2]
np.arccos([0, -1])         # [π/2 π]
np.arctan([0, 1])          # [0. π/4]

# Гиперболические
np.sinh(a)
np.cosh(a)
np.tanh(a)

# Преобразование углов
np.degrees(np.pi)          # 180
np.radians(180)            # π
```

---

## ВОПРОС 47. Генерация псевдослучайных чисел

```python
# Равномерное [0, 1)
np.random.rand(5)          # 1D массив
np.random.rand(3, 4)       # матрица 3x4

# Нормальное (μ=0, σ=1)
np.random.randn(5)

# Целые числа
np.random.randint(0, 10, 5)      # от 0 до 9
np.random.randint(1, 7, (3, 4))  # матрица костей

# Выборка
np.random.choice([1, 2, 3, 4, 5], 10)  # с повторениями
np.random.choice([1, 2, 3], 10, p=[0.1, 0.3, 0.6])  # с вероятностями

# Перестановка
arr = np.arange(10)
np.random.shuffle(arr)     # на месте
np.random.permutation(10)  # новый массив

# Фиксированное seed
np.random.seed(42)
```

---

## ВОПРОС 48. Скалярное произведение одномерных массивов

```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

# Скалярное произведение
np.dot(a, b)               # 1*4 + 2*5 + 3*6 = 32
a @ b                      # то же самое (Python 3.5+)
np.sum(a * b)              # альтернатива

# Математически: a·b = Σ(aᵢ * bᵢ)
```

---

## ВОПРОС 49. Скалярное произведение одномерного и многомерного

```python
a = np.array([1, 2])               # (2,)
m = np.array([[1, 2, 3],          # (2, 3)
              [4, 5, 6]])

result = np.dot(a, m)              # (3,)
# a·m = [1*1+2*4, 1*2+2*5, 1*3+2*6]
#     = [9, 12, 15]

# Или
result = a @ m
```

---

## ВОПРОС 50. Скалярное произведение многомерных массивов

```python
m1 = np.array([[1, 2], [3, 4]])    # (2, 2)
m2 = np.array([[5, 6], [7, 8]])    # (2, 2)

# Матричное умножение
result = np.dot(m1, m2)            # (2, 2)
result = m1 @ m2

# [[1*5+2*7, 1*6+2*8],
#  [3*5+4*7, 3*6+4*8]]
# = [[19, 22], [43, 50]]
```

---

## ВОПРОС 51. Длина вектора

```python
a = np.array([3, 4])

# Евклидова норма (L2)
length = np.linalg.norm(a)         # √(3² + 4²) = 5
length = np.sqrt(np.dot(a, a))     # альтернатива

# Другие нормы
np.linalg.norm(a, ord=1)           # L1: |3| + |4| = 7
np.linalg.norm(a, ord=np.inf)      # L∞: max(3, 4) = 4
```

---

## ВОПРОС 52. Нормализация вектора

**Определение:**
- Приведение вектора к единичной длине
- Сохранение направления

```python
a = np.array([3, 4])

# Нормализация
normalized = a / np.linalg.norm(a)  # [0.6, 0.8]

# Проверка
np.linalg.norm(normalized)          # 1.0
```

---

## ВОПРОС 53. Угол между векторами

```python
a = np.array([1, 0])
b = np.array([0, 1])

# Косинус угла
cos_angle = np.dot(a, b) / (np.linalg.norm(a) * np.linalg.norm(b))

# Угол в радианах
angle = np.arccos(cos_angle)

# Угол в градусах
angle_deg = np.degrees(angle)

# Формула: cos(θ) = (a·b) / (||a|| * ||b||)
```

---

## ВОПРОС 54. Поиск корней полинома

```python
# Полином: x² - 5x + 6 = 0
coefficients = [1, -5, 6]  # от старшей к младшей степени

roots = np.roots(coefficients)
# [3. 2.] - корни уравнения

# Проверка: x² - 5x + 6 = (x-2)(x-3) = 0
```

---

## ВОПРОС 55. Решение системы линейных уравнений

```python
# Система: 2x + 3y = 8
#          4x + y = 10
# Матричный вид: Ax = b

A = np.array([[2, 3],
              [4, 1]])
b = np.array([8, 10])

# Решение
x = np.linalg.solve(A, b)  # [2.2, 1.2]

# Проверка
np.dot(A, x)               # [8. 10.] ≈ b
```

---

## ВОПРОС 56. Назначение и характеристики Pandas

**Назначение:**
- Библиотека для работы с табличными данными
- Анализ и обработка данных

**Преимущества:**
- Метки для строк и столбцов
- Встроенный ввод/вывод (CSV, Excel, SQL, HTML)
- Удобная фильтрация и группировка
- Автоматическая обработка пропущенных значений
- Операции со временными рядами

**Ограничения:**
- Медленнее NumPy на числовых операциях
- Больше памяти
- Сложность API (много методов)

```python
import pandas as pd
```

---

## ВОПРОС 57. Типы структур Pandas

**Series:**
- Одномерный массив с индексом
- Аналог столбца таблицы
- Может содержать любой тип данных

**DataFrame:**
- Двумерная таблица
- Состоит из Series
- Имеет индекс строк и названия столбцов
- Аналог таблицы Excel или SQL

---

## ВОПРОС 58. Создание Series

```python
import pandas as pd

# Из списка
s = pd.Series([1, 2, 3, 4, 5])

# С индексом
s = pd.Series([1, 2, 3], index=['a', 'b', 'c'])

# Из словаря
s = pd.Series({'a': 1, 'b': 2, 'c': 3})

# Из NumPy массива
s = pd.Series(np.array([1, 2, 3]))

# С именем
s = pd.Series([1, 2, 3], name='числа')
```

---

## ВОПРОС 59. Свойства Series

```python
s = pd.Series([1, 2, 3, 4, 5], index=['a', 'b', 'c', 'd', 'e'])

# Размер и форма
s.shape                    # (5,)
s.size                     # 5
len(s)                     # 5

# Индекс и значения
s.index                    # Index(['a', 'b', 'c', 'd', 'e'])
s.values                   # array([1, 2, 3, 4, 5])

# Тип данных
s.dtype                    # int64

# Имя
s.name                     # None или строка
```

---

## ВОПРОС 60. Индексация, срезы и модификация Series

**Индексация:**
```python
s = pd.Series([1, 2, 3, 4, 5], index=['a', 'b', 'c', 'd', 'e'])

s['a']                     # 1 - по метке
s[0]                       # 1 - по позиции
s.loc['a']                 # 1 - по метке
s.iloc[0]                  # 1 - по позиции
```

**Срезы:**
```python
s['a':'c']                 # a, b, c (включая c!)
s[0:2]                     # 0, 1 (не включая 2)
s[::2]                     # каждый второй
```

**Модификация:**
```python
s['a'] = 10                # изменить значение
s[s > 3] = 0               # с условием
s.loc['a'] = 100           # по метке
s.iloc[0] = 100            # по позиции
```

---

## ВОПРОС 61. Создание DataFrame

```python
# Из словаря списков
df = pd.DataFrame({
    'name': ['Alice', 'Bob', 'Charlie'],
    'age': [25, 30, 35],
    'salary': [50000, 60000, 75000]
})

# Из списка списков
df = pd.DataFrame([
    [1, 2, 3],
    [4, 5, 6]
], columns=['A', 'B', 'C'])

# Из NumPy массива
df = pd.DataFrame(np.random.rand(3, 4), 
                  columns=['A', 'B', 'C', 'D'])

# Из списка словарей
df = pd.DataFrame([
    {'name': 'Alice', 'age': 25},
    {'name': 'Bob', 'age': 30}
])
```

---

## ВОПРОС 62. Чтение и запись CSV

**Чтение:**
```python
df = pd.read_csv('file.csv')
df = pd.read_csv('file.csv', delimiter=';')
df = pd.read_csv('file.csv', encoding='utf-8')
df = pd.read_csv('file.csv', index_col='name')
df = pd.read_csv('file.csv', header=0)
df = pd.read_csv('file.csv', names=['col1', 'col2'])
```

**Запись:**
```python
df.to_csv('file.csv')
df.to_csv('file.csv', index=False)
df.to_csv('file.csv', sep=';', encoding='utf-8')
df.to_csv('file.csv', columns=['name', 'age'])
```

---

## ВОПРОС 63. Чтение и запись Excel

**Чтение:**
```python
df = pd.read_excel('file.xlsx')
df = pd.read_excel('file.xlsx', sheet_name='Sheet1')
df = pd.read_excel('file.xlsx', sheet_name=0)
df = pd.read_excel('file.xlsx', header=0)
```

**Запись:**
```python
df.to_excel('file.xlsx')
df.to_excel('file.xlsx', sheet_name='MySheet')
df.to_excel('file.xlsx', index=False)

# Несколько листов
with pd.ExcelWriter('file.xlsx') as writer:
    df1.to_excel(writer, sheet_name='Sheet1')
    df2.to_excel(writer, sheet_name='Sheet2')
```

---

## ВОПРОС 64. Чтение файлов HTML

```python
# Чтение всех таблиц со страницы
df_list = pd.read_html('https://example.com')
# Возвращает список DataFrame

# Выбор конкретной таблицы
df = df_list[0]  # первая таблица

# Из файла
df_list = pd.read_html('page.html')

# С параметрами
df_list = pd.read_html('page.html', 
                       header=0,
                       encoding='utf-8')
```

---

## ВОПРОС 65. Работа с SQL

**Чтение:**
```python
import sqlite3

conn = sqlite3.connect('database.db')
df = pd.read_sql('SELECT * FROM table_name', conn)
df = pd.read_sql('SELECT name, age FROM users WHERE age > 25', conn)
df = pd.read_sql_table('table_name', conn)
df = pd.read_sql_query('SELECT * FROM table', conn)
```

**Запись:**
```python
df.to_sql('table_name', conn, if_exists='replace')
# if_exists: 'fail', 'replace', 'append'

df.to_sql('table_name', conn, if_exists='append', index=False)
```

---

## ВОПРОС 66. Отображение DataFrame

**Просмотр:**
```python
df.head()                  # первые 5 строк
df.head(10)                # первые 10
df.tail()                  # последние 5
df.sample(5)               # случайные 5

df.info()                  # информация о типах
df.describe()              # статистика по столбцам
df.dtypes                  # типы данных
```

**Настройки вывода:**
```python
pd.set_option('display.max_rows', 100)
pd.set_option('display.max_columns', 20)
pd.set_option('display.width', 1000)
pd.set_option('display.precision', 2)
```

**Свойства:**
```python
df.shape                   # (строк, столбцов)
df.index                   # индекс строк
df.columns                 # названия столбцов
df.size                    # всего элементов
```

---

## ВОПРОС 67. Типы данных для чисел и логических значений

**Числовые:**
```python
int64                      # целые числа
float64                    # вещественные числа
```

**Логические:**
```python
bool                       # True/False
```

**Примеры:**
```python
df['age'].dtype            # int64
df['salary'].dtype         # float64
df['is_active'].dtype      # bool

# Преобразование
df['age'] = df['age'].astype(int)
df['salary'] = df['salary'].astype(float)
```

---

## ВОПРОС 68. Тип данных для строк

```python
object                     # строки (по умолчанию)
string                     # специальный тип (Pandas 1.0+)

# Примеры
df['name'].dtype           # object
df['name'] = df['name'].astype('string')  # string

# Преобразование
df['name'] = df['name'].astype(str)
```

---

## ВОПРОС 69. Пропущенные значения

**Обозначения:**
```python
NaN                        # float значение
pd.NA                      # универсальное (Pandas 1.0+)
None                       # в object типах
```

**Выявление:**
```python
df.isnull()                # матрица True/False
df.notnull()               # обратная
df.isna()                  # то же что isnull()

df.isnull().sum()          # количество NaN в столбцах
df.isnull().sum().sum()    # общее количество
```

**Влияние на операции:**
```python
df.mean()                  # пропускает NaN (skipna=True)
df.sum(skipna=False)       # учитывает NaN (результат NaN)
df.count()                 # считает только не-NaN
```

---

## ВОПРОС 70. Индексация и выборка данных

**Индексатор [ ]:**
```python
df['name']                 # столбец (Series)
df[['name', 'age']]        # несколько столбцов (DataFrame)
df[0:3]                    # строки по позиции
```

**loc - по метке:**
```python
df.loc[0]                  # строка с индексом 0
df.loc[0, 'name']          # значение
df.loc[0:2, 'name':'age']  # срез (включая концы!)
df.loc[df['age'] > 30]     # по условию
```

**iloc - по позиции:**
```python
df.iloc[0]                 # первая строка
df.iloc[0, 1]              # строка 0, столбец 1
df.iloc[0:2, 0:2]          # срез (не включая конец!)
df.iloc[[0, 2, 4]]         # конкретные строки
```

---

## ВОПРОС 71. Итерация по столбцам и строкам

**По столбцам:**
```python
for col in df:
    print(col)             # имена

for col in df.columns:
    print(df[col])         # Series
```

**По строкам:**
```python
# iterrows() - медленно
for idx, row in df.iterrows():
    print(idx, row['name'])

# itertuples() - быстрее
for row in df.itertuples():
    print(row.Index, row.name)
```

---

## ВОПРОС 72. Векторизация и универсальные функции

**Векторизация:**
```python
df['salary'] * 1.1         # увеличить на 10%
df['total'] = df['age'] + df['salary']
```

**Универсальные функции:**
```python
np.sqrt(df['age'])
np.log(df['salary'])
np.exp(df['value'])
```

**apply:**
```python
df['age'].apply(lambda x: x * 2)
df.apply(lambda row: row['salary'] * 2, axis=1)
```

---

## ВОПРОС 73. Арифметические операции

```python
df['salary'] + 1000        # прибавить
df['age'] * 2              # умножить
df['salary'] / df['age']   # разделить столбцы

# С DataFrame
df1 + df2                  # поэлементное сложение
df1 * df2                  # поэлементное умножение

# Со скаляром
df * 2                     # все числовые столбцы
```

---

## ВОПРОС 74. Фильтрация с логическими операторами

```python
# Одно условие
df[df['age'] > 30]

# Несколько условий (И)
df[(df['age'] > 30) & (df['salary'] > 50000)]

# Несколько условий (ИЛИ)
df[(df['age'] < 25) | (df['age'] > 35)]

# Отрицание
df[~(df['age'] > 30)]

# isin()
df[df['region'].isin(['Москва', 'Курск'])]

# between()
df[df['age'].between(30, 40)]
```

---

## ВОПРОС 75. Фильтрация с query()

```python
# Простое условие
df.query('age > 30')

# Несколько условий
df.query('age > 30 and salary > 50000')
df.query('age < 25 or age > 35')

# С переменными
threshold = 30
df.query('age > @threshold')

# Со списками
cities = ['Москва', 'Курск']
df.query('city in @cities')
```

---

## ВОПРОС 76. Операции со столбцами - добавление, генерация

**Добавление:**
```python
df['new_col'] = 0          # новый столбец
df['total'] = df['a'] + df['b']
df.insert(1, 'new', 0)     # на позицию 1
```

**Генерация:**
```python
df['category'] = df['age'].apply(lambda x: 'young' if x < 30 else 'old')
df['squared'] = df['value'] ** 2
```

**Переупорядочивание:**
```python
df = df[['col2', 'col1', 'col3']]  # новый порядок
df = df.reindex(columns=['col2', 'col1', 'col3'])
```

---

## ВОПРОС 77. Операции со столбцами - удаление, переименование

**Удаление:**
```python
df.drop('col_name', axis=1)
df.drop(['col1', 'col2'], axis=1)
df.drop(columns=['col1'])
del df['col_name']
```

**Переименование:**
```python
df.rename(columns={'old': 'new'})
df.rename(columns={'col1': 'new1', 'col2': 'new2'})
df.columns = ['new1', 'new2', 'new3']
```

**Замена содержимого:**
```python
df['col'] = new_values
df['col'] = df['other_col'] * 2
```

---

## ВОПРОС 78. Операции со строками - добавление, удаление

**Добавление:**
```python
# concat
new_row = pd.DataFrame({'name': ['Alice'], 'age': [25]})
df = pd.concat([df, new_row], ignore_index=True)

# loc
df.loc[len(df)] = ['Alice', 25]
```

**Удаление:**
```python
df.drop(0)                 # по индексу
df.drop([0, 1, 2])         # несколько строк
df.drop(index=df.index[0]) # первая строка

# По условию
df = df[df['age'] > 30]
```

---

## ВОПРОС 79. Метод replace()

**Скалярные значения:**
```python
df.replace(35, 37)         # заменить 35 на 37
```

**Списки:**
```python
df.replace([0, 1], 2)      # 0 и 1 на 2
df.replace([0, 1], [1, 2]) # 0→1, 1→2
```

**Словари:**
```python
df.replace({0: 'ж', 1: 'м'})  # во всем DataFrame
df['gender'].replace({0: 'ж', 1: 'м'})  # в столбце

# Для конкретных столбцов
df.replace({'col1': {0: 'zero'}, 'col2': {1: 'one'}})
```

---

## ВОПРОС 80. Метод map()

```python
# Для Series
df['gender'].map({0: 'Female', 1: 'Male'})
df['gender'].map({'М': 'Male', 'Ж': 'Female'})

# С функцией
df['age'].map(lambda x: 'young' if x < 30 else 'old')

# Применяется только к Series, не к DataFrame!
```

---

## ВОПРОС 81. Метод where()

```python
# Оставить значения где True, иначе NaN
df['age'].where(df['age'] > 25)

# С заменой на другое значение
df['age'].where(df['age'] > 25, 0)  # иначе 0

# Для DataFrame
df.where(df > 0)           # отрицательные → NaN
df.where(df > 0, 0)        # отрицательные → 0
```

---

## ВОПРОС 82. Метод apply()

```python
# К Series
df['age'].apply(lambda x: x * 2)
df['name'].apply(len)

# К DataFrame по столбцам (axis=0, по умолчанию)
df.apply(lambda col: col.max())

# К DataFrame по строкам (axis=1)
df.apply(lambda row: row['salary'] * 2 if row['age'] > 30 else row['salary'], axis=1)

# С функцией
def categorize(x):
    return 'high' if x > 50000 else 'low'
df['salary'].apply(categorize)
```

---

## ВОПРОС 83. Метод applymap()

**Устарел с Pandas 2.1, используйте map():**
```python
# Старый способ (applymap)
df.applymap(lambda x: str(x).upper() if isinstance(x, str) else x)

# Новый способ (map)
df.map(lambda x: str(x).upper() if isinstance(x, str) else x)

# Применяется к каждому элементу DataFrame
```

---

## ВОПРОС 84. Индексаторы loc и iloc для изменения

**loc:**
```python
df.loc[0, 'name'] = 'Alice'
df.loc[0:2, 'age'] = 25
df.loc[df['age'] > 30, 'salary'] *= 1.1
```

**iloc:**
```python
df.iloc[0, 1] = 'Bob'
df.iloc[0:2, 0:2] = 0
df.iloc[[0, 2], [1, 3]] = 99
```

---

## ВОПРОС 85. Сортировка данных

```python
# По столбцу
df.sort_values(by='age')
df.sort_values(by='age', ascending=False)

# По нескольким столбцам
df.sort_values(by=['age', 'salary'])
df.sort_values(by=['age', 'salary'], ascending=[True, False])

# По индексу
df.sort_index()
df.sort_index(ascending=False)

# По названиям столбцов
df.sort_index(axis=1)

# На месте
df.sort_values(by='age', inplace=True)
```

---

## ВОПРОС 86. Объединение Series

```python
s1 = pd.Series([1, 2, 3])
s2 = pd.Series([4, 5, 6])

# concat
pd.concat([s1, s2])        # объединить
pd.concat([s1, s2], ignore_index=True)  # переиндексировать

# append (устарел)
s1.append(s2)
```

---

## ВОПРОС 87. Объединение Series и DataFrame - concat()

```python
# По строкам (axis=0, по умолчанию)
pd.concat([df1, df2])
pd.concat([df1, df2], ignore_index=True)

# По столбцам (axis=1)
pd.concat([df1, df2], axis=1)

# Типы объединения
pd.concat([df1, df2], join='outer')  # все индексы
pd.concat([df1, df2], join='inner')  # пересечение

# С ключами
pd.concat([df1, df2], keys=['first', 'second'])
```

---

## ВОПРОС 88. Метод merge()

```python
# По одному столбцу
pd.merge(df1, df2, on='id')

# По разным столбцам
pd.merge(df1, df2, left_on='id1', right_on='id2')

# Типы объединения
pd.merge(df1, df2, how='inner')   # только совпадающие
pd.merge(df1, df2, how='left')    # все из левого
pd.merge(df1, df2, how='right')   # все из правого
pd.merge(df1, df2, how='outer')   # все из обоих

# По индексу
pd.merge(df1, df2, left_index=True, right_index=True)
```

---

## ВОПРОС 89. Агрегирование данных

**Назначение:**
- Вычисление суммарных статистик
- Объединение данных в одно значение

**Функции:**
```python
df['salary'].sum()         # сумма
df['salary'].mean()        # среднее
df['age'].max()            # максимум
df['age'].min()            # минимум
df['age'].std()            # стандартное отклонение
df['age'].var()            # дисперсия
df['age'].count()          # количество (не-NaN)
df['age'].median()         # медиана
```

---

## ВОПРОС 90. Функция agg()

```python
# Одна функция для всех столбцов
df.agg('sum')
df.agg(['sum', 'mean', 'std'])

# Разные функции для разных столбцов
df.agg({
    'salary': 'sum',
    'age': 'mean'
})

df.agg({
    'salary': ['sum', 'mean'],
    'age': ['min', 'max']
})

# Для Series
df['salary'].agg(['sum', 'mean', 'std'])
```

---

## ВОПРОС 91. Группировка данных

**Назначение:**
- Разделение данных на группы
- Применение функций к группам
- Объединение результатов

**Схема "split-apply-combine":**
1. **Split** - разделить по группам
2. **Apply** - применить функцию к каждой группе
3. **Combine** - объединить результаты

```python
grouped = df.groupby('department')
```

---

## ВОПРОС 92. Группировка и агрегирование

**По одному столбцу:**
```python
df.groupby('department')['salary'].mean()
df.groupby('department')[['salary', 'age']].mean()
```

**По нескольким столбцам:**
```python
df.groupby(['department', 'gender'])['salary'].mean()
df.groupby(['department', 'gender']).agg({
    'salary': 'mean',
    'age': 'max'
})
```

**Разные функции:**
```python
df.groupby('department').agg({
    'salary': ['mean', 'sum'],
    'age': ['min', 'max']
})
```

---

## ВОПРОС 93. Преобразование сгруппированных данных

```python
# transform - сохраняет форму DataFrame
df['normalized_salary'] = df.groupby('department')['salary'].transform(
    lambda x: x / x.mean()
)

df['salary_rank'] = df.groupby('department')['salary'].rank()

# Разница с средним по группе
df['diff_from_mean'] = df.groupby('department')['salary'].transform(
    lambda x: x - x.mean()
)
```

---

## ВОПРОС 94. Фильтрация сгруппированных данных

```python
# Оставить группы, где среднее > 50000
df.groupby('department').filter(lambda x: x['salary'].mean() > 50000)

# Оставить группы с количеством > 5
df.groupby('department').filter(lambda x: len(x) > 5)

# Оставить группы, где максимум < 100000
df.groupby('department').filter(lambda x: x['salary'].max() < 100000)
```

---

## ВОПРОС 95. Сводные таблицы

**Назначение:**
- Агрегирование данных по строкам и столбцам
- Аналог pivot table в Excel

**Построение:**
```python
pd.pivot_table(df,
               values='salary',      # что агрегировать
               index='department',   # строки
               columns='gender',     # столбцы
               aggfunc='mean')       # функция

# С несколькими значениями
pd.pivot_table(df,
               values=['salary', 'age'],
               index='department',
               columns='gender',
               aggfunc='mean')

# С итогами
pd.pivot_table(df,
               values='salary',
               index='department',
               columns='gender',
               aggfunc='mean',
               margins=True)         # добавить итоги
```

---

## ВОПРОС 96. Кросс-таблицы

**Назначение:**
- Частотное распределение
- Подсчет комбинаций категорий

**Построение:**
```python
# Простая кросс-таблица
pd.crosstab(df['department'], df['gender'])

# С агрегированием
pd.crosstab(df['department'], df['gender'],
            values=df['salary'],
            aggfunc='mean')

# С итогами
pd.crosstab(df['department'], df['gender'],
            margins=True)

# С нормализацией
pd.crosstab(df['department'], df['gender'],
            normalize=True)  # в процентах
```

---

## ВОПРОС 97. Векторизованные операции над строками

```python
# Через .str accessor
df['name'].str.upper()     # ВЕРХНИЙ РЕГИСТР
df['name'].str.lower()     # нижний регистр
df['name'].str.len()       # длина
df['name'].str[0:3]        # срез
df['name'].str.split()     # разделить

# Без циклов, применяется ко всей Series!
```

---

## ВОПРОС 98. Методы работы со строками

```python
# Регистр
df['name'].str.upper()
df['name'].str.lower()
df['name'].str.capitalize()
df['name'].str.title()

# Проверки
df['email'].str.contains('@')
df['email'].str.startswith('a')
df['email'].str.endswith('.com')

# Замена
df['text'].str.replace('old', 'new')
df['text'].str.strip()     # убрать пробелы

# Разделение
df['name'].str.split(' ')
df['email'].str.split('@', expand=True)  # в столбцы

# Извлечение
df['text'].str.extract(r'(\d+)')  # regex
df['text'].str.findall(r'\d+')

# Индексация
df['text'].str[0:5]
```

---

## ВОПРОС 99. Дата и время в Python

```python
from datetime import datetime, date, time, timedelta

# date - только дата
d = date(2024, 12, 28)
d.year, d.month, d.day     # 2024, 12, 28

# time - только время
t = time(14, 30, 0)
t.hour, t.minute, t.second # 14, 30, 0

# datetime - дата и время
dt = datetime(2024, 12, 28, 14, 30, 0)
dt.year, dt.month, dt.day
dt.hour, dt.minute, dt.second
dt.weekday()               # день недели (0=пн)

# timedelta - интервал
td = timedelta(days=1, hours=2, minutes=30)
```

---

## ВОПРОС 100. Timestamp в Pandas

```python
# Создание
ts = pd.Timestamp('2024-12-28')
ts = pd.Timestamp(datetime(2024, 12, 28))
ts = pd.Timestamp('2024-12-28 14:30:00')
ts = pd.Timestamp(year=2024, month=12, day=28)

# Текущее время
ts = pd.Timestamp.now()
ts = pd.Timestamp.today()

# Свойства
ts.year, ts.month, ts.day
ts.hour, ts.minute, ts.second
ts.day_name()              # 'Saturday'
ts.month_name()            # 'December'

# Арифметика
ts + pd.Timedelta('1 day')
```

---

## ВОПРОС 101. Timedelta в Pandas

```python
# Создание
td = pd.Timedelta('1 days')
td = pd.Timedelta('2 hours 30 minutes')
td = pd.Timedelta(days=1, hours=2)
td = pd.Timedelta(seconds=3600)

# Свойства
td.days
td.seconds
td.total_seconds()

# Арифметика
pd.Timestamp('2024-12-28') + td
pd.Timestamp('2024-12-28') - pd.Timestamp('2024-12-01')
```

---

## ВОПРОС 102. Period в Pandas

```python
# Создание
p = pd.Period('2024-12', freq='M')  # месяц
p = pd.Period('2024-Q1', freq='Q')  # квартал
p = pd.Period('2024', freq='Y')     # год
p = pd.Period('2024-12-28', freq='D')  # день

# Свойства
p.month
p.quarter
p.year

# Арифметика
p + 1                      # следующий период
p - 2                      # предыдущие периоды
```

---

## ВОПРОС 103. Создание временных рядов

```python
# date_range - диапазон дат
dates = pd.date_range('2024-01-01', periods=10, freq='D')  # дни
dates = pd.date_range('2024-01-01', '2024-12-31', freq='W')  # недели
dates = pd.date_range('2024-01-01', periods=12, freq='M')  # месяцы

# Создание Series/DataFrame
s = pd.Series(range(10), index=dates)
df = pd.DataFrame({'value': range(10)}, index=dates)

# Индексация по дате
s['2024-01-01']
s['2024-01']               # весь январь
s['2024']                  # весь год
s['2024-01-01':'2024-01-05']  # диапазон
```

---

## ВОПРОС 104. Передискретизация временных рядов

```python
# Создание временного ряда
dates = pd.date_range('2024-01-01', periods=100, freq='D')
df = pd.DataFrame({'value': range(100)}, index=dates)

# resample - изменение частоты
df.resample('W').mean()    # еженедельное среднее
df.resample('M').sum()     # ежемесячная сумма
df.resample('Q').max()     # квартальный максимум

# Методы агрегирования
df.resample('W').agg(['mean', 'sum', 'std'])

# Интерполяция при увеличении частоты
df.resample('H').interpolate()  # часовая
```

---

## ВОПРОС 105. Архитектура графика в Matplotlib

**Иерархия объектов:**

1. **Figure** - окно графика, контейнер для всех элементов
2. **Axes** - область рисования с координатами (может быть несколько)
3. **Axis** - координатные оси (x, y, z)
4. **Artists** - элементы графика (линии, текст, маркеры и т.д.)

```python
import matplotlib.pyplot as plt

fig = plt.figure()         # Figure
ax = fig.add_subplot()     # Axes
```

---

## ВОПРОС 106. Интерфейс в стиле MATLAB

**Принципы:**
- Функции pyplot управляют текущим графиком
- Простой и быстрый
- Неявное создание объектов

```python
import matplotlib.pyplot as plt

plt.plot([1, 2, 3], [1, 4, 9])
plt.xlabel('X')
plt.ylabel('Y')
plt.title('График')
plt.grid()
plt.show()

# Несколько графиков
plt.subplot(1, 2, 1)
plt.plot([1, 2, 3])
plt.subplot(1, 2, 2)
plt.plot([3, 2, 1])
plt.show()
```

---

## ВОПРОС 107. Объектно-ориентированный интерфейс

**Принципы:**
- Явное создание Figure и Axes
- Больше контроля
- Рекомендуется для сложных графиков

```python
import matplotlib.pyplot as plt

# Создание
fig, ax = plt.subplots()

# Построение
ax.plot([1, 2, 3], [1, 4, 9])
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_title('График')
ax.grid()

plt.show()

# Несколько подграфиков
fig, axes = plt.subplots(1, 2, figsize=(10, 4))
axes[0].plot([1, 2, 3])
axes[1].plot([3, 2, 1])
plt.show()
```

---

## ВОПРОС 108. Изменение размера изображения

**MATLAB-стиль:**
```python
plt.figure(figsize=(10, 6))    # ширина, высота в дюймах
plt.figure(dpi=100)            # разрешение
plt.plot([1, 2, 3])
```

**Object-oriented:**
```python
fig = plt.figure(figsize=(10, 6))
fig.set_dpi(100)

# Или сразу
fig, ax = plt.subplots(figsize=(10, 6), dpi=100)
```

**После создания:**
```python
fig.set_size_inches(12, 8)
fig.set_dpi(150)
```

---

## ВОПРОС 109. Функция plot() - параметры

```python
plt.plot(x, y)                 # базовый график
plt.plot(y)                    # x автоматически
plt.plot(x1, y1, x2, y2)      # несколько графиков

# Основные параметры:
# - x, y: данные
# - color: цвет
# - linestyle: стиль линии
# - linewidth: ширина линии
# - marker: маркеры
# - markersize: размер маркеров
# - label: для легенды
# - alpha: прозрачность

plt.plot([1, 2, 3], [1, 4, 9],
         color='blue',
         linestyle='--',
         linewidth=2,
         marker='o',
         markersize=8,
         label='Данные',
         alpha=0.7)
```

---

## ВОПРОС 110. Параметры цвета, стиля, маркеров

**Цвет:**
```python
plt.plot(x, y, color='blue')   # по имени
plt.plot(x, y, color='b')      # сокращение (rgbcmyk)
plt.plot(x, y, color='#FF0000')  # HEX
plt.plot(x, y, color=(1, 0, 0))  # RGB (0-1)
plt.plot(x, y, 'b')            # краткая форма
```

**Стиль линии:**
```python
plt.plot(x, y, linestyle='-')   # непрерывная
plt.plot(x, y, linestyle='--')  # штриховая
plt.plot(x, y, linestyle='-.')  # штрих-точка
plt.plot(x, y, linestyle=':')   # точечная
plt.plot(x, y, '--')            # краткая форма
```

**Маркеры:**
```python
plt.plot(x, y, marker='o')      # окружности
plt.plot(x, y, marker='^')      # треугольники
plt.plot(x, y, marker='s')      # квадраты
plt.plot(x, y, marker='*')      # звезды
plt.plot(x, y, 'o')             # краткая форма
plt.plot(x, y, 'bo--')          # синие круги штриховая
```

---

## ВОПРОС 111. Параметры осей и меток

**Диапазоны осей:**
```python
plt.xlim(0, 10)                # диапазон X
plt.ylim(0, 100)               # диапазон Y
plt.axis([0, 10, 0, 100])      # оба диапазона

# OO-стиль
ax.set_xlim(0, 10)
ax.set_ylim(0, 100)
```

**Метки осей:**
```python
plt.xticks([0, 5, 10])         # позиции меток X
plt.yticks([0, 50, 100])       # позиции меток Y
plt.xticks([0, 5, 10], ['low', 'mid', 'high'])  # с подписями

# OO-стиль
ax.set_xticks([0, 5, 10])
ax.set_xticklabels(['low', 'mid', 'high'])
```

---

## ВОПРОС 112. Текстовые элементы

```python
# Названия осей
plt.xlabel('Ось X')
plt.ylabel('Ось Y')

# Заголовок
plt.title('Название графика')

# Текст на графике
plt.text(5, 50, 'Текст')
plt.annotate('Точка', xy=(5, 50), xytext=(7, 70),
             arrowprops=dict(facecolor='black'))

# OO-стиль
ax.set_xlabel('Ось X')
ax.set_ylabel('Ось Y')
ax.set_title('Название')
ax.text(5, 50, 'Текст')
```

---

## ВОПРОС 113. Легенда

```python
# С label в plot
plt.plot([1, 2, 3], label='Данные 1')
plt.plot([3, 2, 1], label='Данные 2')
plt.legend()

# Позиция
plt.legend(loc='upper right')  # или 'best', 'lower left' и т.д.
plt.legend(loc=(0.5, 0.5))     # координаты

# Параметры
plt.legend(frameon=False)      # без рамки
plt.legend(shadow=True)        # с тенью
plt.legend(ncol=2)             # в 2 колонки
```

---

## ВОПРОС 114. subplot() - недостатки

```python
plt.subplot(2, 2, 1)           # 2x2 сетка, график 1
plt.plot([1, 2, 3])

plt.subplot(2, 2, 2)           # график 2
plt.plot([3, 2, 1])

plt.subplot(2, 2, 3)           # график 3
plt.plot([1, 3, 2])
```

**Недостатки:**
- Сложно синхронизировать параметры
- Неудобно работать с отдельными графиками
- Нет прямого доступа к объектам Axes
- Используется глобальное состояние

---

## ВОПРОС 115. subplots()

```python
# Создание сетки
fig, axes = plt.subplots(2, 2, figsize=(10, 8))

# Доступ к подграфикам
axes[0, 0].plot([1, 2, 3])
axes[0, 1].plot([3, 2, 1])
axes[1, 0].plot([1, 3, 2])
axes[1, 1].plot([2, 1, 3])

# Общие параметры
fig.suptitle('Общий заголовок')

# Один ряд/столбец
fig, axes = plt.subplots(1, 3)  # axes - 1D массив
axes[0].plot([1, 2, 3])

# Общие оси
fig, axes = plt.subplots(2, 2, sharex=True, sharey=True)
```

---

## ВОПРОС 116. Ступенчатый график

**Назначение:**
- Отображение дискретных изменений
- График с резкими переходами

```python
plt.step(x, y, where='pre')    # ступенька слева
plt.step(x, y, where='post')   # ступенька справа
plt.step(x, y, where='mid')    # ступенька посередине

# Параметры
plt.step(x, y, color='blue', linewidth=2, label='Данные')

# OO-стиль
ax.step(x, y, where='pre')
```

---

## ВОПРОС 117. Столбчатая диаграмма

**Назначение:**
- Сравнение категорий
- Отображение дискретных данных

```python
# Вертикальная
plt.bar(x, height)
plt.bar(['A', 'B', 'C'], [10, 20, 15])

# Горизонтальная
plt.barh(y, width)

# Параметры
plt.bar(x, height,
        width=0.8,             # ширина столбцов
        color='blue',
        edgecolor='black',     # цвет границы
        linewidth=1.2,
        alpha=0.7,
        label='Данные')
```

---

## ВОПРОС 118. Несколько столбчатых диаграмм

**Способы:**

1. **Рядом:**
```python
x = np.arange(3)
width = 0.35
plt.bar(x - width/2, data1, width, label='Группа 1')
plt.bar(x + width/2, data2, width, label='Группа 2')
plt.xticks(x, ['A', 'B', 'C'])
```

2. **Стопкой:**
```python
plt.bar(x, data1, label='Группа 1')
plt.bar(x, data2, bottom=data1, label='Группа 2')
```

---

## ВОПРОС 119. Круговая диаграмма

**Назначение:**
- Отображение долей/процентов
- Сравнение частей целого

```python
plt.pie([30, 25, 20, 25])

# С параметрами
plt.pie([30, 25, 20, 25],
        labels=['A', 'B', 'C', 'D'],
        autopct='%1.1f%%',     # показать проценты
        colors=['red', 'blue', 'green', 'yellow'],
        explode=[0.1, 0, 0, 0],  # выделить сектор
        shadow=True,
        startangle=90)

plt.axis('equal')              # круг, не эллипс
```

---

## ВОПРОС 120. Гистограмма

**Назначение:**
- Распределение данных
- Частота значений

```python
plt.hist(data, bins=10)        # 10 интервалов

# Параметры
plt.hist(data,
         bins=20,              # количество интервалов
         bins=[0, 10, 20, 30],  # или границы
         color='blue',
         edgecolor='black',
         alpha=0.7,
         density=True,         # нормализация
         cumulative=True)      # накопленная
```

---

## ВОПРОС 121. Несколько гистограмм

**Способы:**

1. **Наложение:**
```python
plt.hist(data1, bins=10, alpha=0.5, label='Группа 1')
plt.hist(data2, bins=10, alpha=0.5, label='Группа 2')
plt.legend()
```

2. **Рядом:**
```python
plt.hist([data1, data2], bins=10, label=['Группа 1', 'Группа 2'])
plt.legend()
```

---

## ВОПРОС 122. Диаграмма boxplot

**Назначение:**
- Отображение распределения
- Выявление выбросов
- Показывает: медиану, квартили, выбросы

```python
plt.boxplot(data)

# Несколько
plt.boxplot([data1, data2, data3],
            labels=['Группа 1', 'Группа 2', 'Группа 3'])

# Параметры
plt.boxplot(data,
            vert=True,         # вертикальный
            showmeans=True,    # показать среднее
            notch=True)        # с вырезом
```

---

## ВОПРОС 123. Столбчатая диаграмма в Pandas

```python
# Для Series
df['category'].value_counts().plot(kind='bar')

# Для DataFrame
df.plot(kind='bar')
df.plot.bar()                  # альтернатива

# Параметры
df.plot(kind='bar',
        figsize=(10, 6),
        color=['blue', 'red'],
        title='Заголовок',
        xlabel='X',
        ylabel='Y',
        legend=True,
        rot=45)                # поворот меток

# Горизонтальная
df.plot(kind='barh')
```

---

## ВОПРОС 124. Несколько столбчатых диаграмм в Pandas

**Способы:**

1. **Рядом (по умолчанию):**
```python
df.plot(kind='bar')
```

2. **Стопкой:**
```python
df.plot(kind='bar', stacked=True)
```

3. **Отдельные подграфики:**
```python
df.plot(kind='bar', subplots=True, figsize=(12, 8))
```

---

## ВОПРОС 125. Гистограмма в Pandas

```python
# Для Series
df['age'].plot(kind='hist')
df['age'].hist()               # альтернатива

# Для DataFrame
df.plot(kind='hist')
df.hist()

# Параметры
df['age'].plot(kind='hist',
               bins=20,
               edgecolor='black',
               alpha=0.7,
               title='Распределение возраста')
```

---

## ВОПРОС 126. Несколько гистограмм в Pandas

**Способы:**

1. **Наложение:**
```python
df[['col1', 'col2']].plot(kind='hist', alpha=0.5)
```

2. **Отдельные подграфики:**
```python
df.hist(figsize=(12, 10))
df.plot(kind='hist', subplots=True, figsize=(12, 10))
```

---

## ВОПРОС 127. Точечный график (scatter) в Matplotlib

**Назначение:**
- Связь между переменными
- Выявление корреляции

```python
plt.scatter(x, y)

# Параметры
plt.scatter(x, y,
            s=100,             # размер точек
            c=colors,          # цвета (массив или один)
            cmap='viridis',    # цветовая карта
            alpha=0.5,
            marker='o',
            edgecolors='black',
            linewidths=1)

# С цветовой шкалой
plt.scatter(x, y, c=z, cmap='viridis')
plt.colorbar()
```

---

## ВОПРОС 128. Точечный график в Pandas

```python
# Базовый
df.plot(kind='scatter', x='age', y='salary')
df.plot.scatter(x='age', y='salary')  # альтернатива

# Параметры
df.plot(kind='scatter',
        x='age',
        y='salary',
        s=100,             # размер
        c='blue',          # цвет
        alpha=0.5,
        title='Зарплата vs Возраст')

# Цвет от третьей переменной
df.plot(kind='scatter',
        x='age',
        y='salary',
        c='experience',    # цвет по столбцу
        cmap='viridis',
        colorbar=True)
```

---

## ВОПРОС 129. Boxplot в Pandas

```python
# Для всего DataFrame
df.boxplot()
df.plot(kind='box')

# Для конкретного столбца
df['age'].plot(kind='box')

# Группировка
df.boxplot(column='salary', by='department')

# Параметры
df.boxplot(column=['salary', 'age'],
           figsize=(10, 6),
           vert=True,
           grid=True)

# Несколько подграфиков
df.boxplot(column=['salary', 'age'],
           by='department',
           figsize=(12, 8))
```

---

# КОНЕЦ

**Общее количество вопросов: 129**

**Удачи на зачете! 🎓📚**