Для выполнения задания будем использовать библиотеки `pandas`, `numpy` и модуль `string`. Ниже представлено решение с комментариями.

```python
import pandas as pd
import numpy as np
import string

# Фиксируем случайное зерно для воспроизводимости
np.random.seed(42)

# 1. Создание Series на основе массива NumPy
data_series = np.random.randint(1, 100, 10)  # 10 случайных целых чисел
series = pd.Series(data_series)
print("1. Series:\n", series)

# 2. Создание DataFrame с 22 строками и тремя столбцами
data = {
    'Целые числа': np.random.randint(1, 100, 22),
    'Вещественные числа': np.random.uniform(0, 10, 22).round(3),
    'Строки': [''.join(np.random.choice(list(string.ascii_letters), 5)) for _ in range(22)]
}
df = pd.DataFrame(data)
print("\n2. DataFrame:\n", df)

# 3. Запись DataFrame в файл Excel
df.to_excel('dataframe.xlsx', index=False)

# 4. Импорт данных из Excel
imported_df = pd.read_excel('dataframe.xlsx')
print("\n4. Импортированный DataFrame:\n", imported_df)

# 5. Изменение настроек отображения чисел
pd.set_option('display.float_format', '{:.3f}'.format)
print("\n5. Текущая настройка float_format:", pd.get_option('display.float_format'))

# 6. Информация о размерности
print(f"\n6. Размерность таблицы: {imported_df.shape}")

# 7. Выбор нечетных строк столбцов 1 и 2
# Способ а) loc
selected_loc = imported_df.loc[1::2, ['Целые числа', 'Вещественные числа']]
print("\n7а. Выбор через loc:\n", selected_loc)

# Способ б) iloc
selected_iloc = imported_df.iloc[1::2, [0, 1]]
print("\n7б. Выбор через iloc:\n", selected_iloc)

# 8. Метод DataFrame.items()
print("\n8. Пример использования items():")
for col_name, col_data in imported_df.items():
    print(f"Столбец: {col_name}")
    print(f"Первые 3 значения:\n{col_data.head(3)}")
```

**Пояснения:**

1. **Series**: Создается из массива NumPy с 10 случайными целыми числами.
2. **DataFrame**:
   - **Целые числа**: 22 значения от 1 до 100.
   - **Вещественные числа**: 22 значения от 0 до 10 с округлением до 3 знаков.
   - **Строки**: 22 строки из 5 случайных букв.
3. **Сохранение в Excel**: Файл `dataframe.xlsx` создается в текущей директории.
4. **Импорт из Excel**: Данные считываются обратно в DataFrame.
5. **Настройки отображения**: Все числа форматируются для отображения с тремя знаками после запятой.
6. **Размерность**: Выводится кортеж `(строки, столбцы)`.
7. **Выбор данных**:
   - **loc**: Используются метки строк и именованные столбцы.
   - **iloc**: Используются целочисленные индексы строк и столбцов.
8. **DataFrame.items()**:
   - **Назначение**: Итерация по парам `(название_столбца, данные_столбца)`.
   - **Параметменты**: Нет обязательных параметров.
   - **Пример**: Вывод названий столбцов и первых трех значений каждого.

**Результат выполнения:**
- Созданы все указанные объекты.
- Настройки форматирования применены.
- Данные выбраны двумя способами.
- Продемонстрирована работа метода `items()`.
