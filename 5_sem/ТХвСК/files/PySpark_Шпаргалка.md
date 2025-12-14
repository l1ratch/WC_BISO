# Таблица методов и функций PySpark, использованных в работе

## Основные классы и объекты

| Класс/Объект | Назначение | Пример использования |
|--------------|-----------|---------------------|
| `SparkSession` | Точка входа для работы с Spark, управляет контекстом и сессией | `SparkSession.builder.appName("name").getOrCreate()` |
| `DataFrame` | Распределенная коллекция данных, организованная в именованные столбцы | `df = spark.read.csv(...)` |
| `Column` | Представляет столбец в DataFrame | `df["column_name"]` |

## Методы чтения данных

| Метод | Назначение | Параметры | Пример |
|-------|-----------|-----------|---------|
| `spark.read.csv()` | Чтение CSV-файла | `path`, `header`, `inferSchema`, `schema` | `spark.read.csv("file.csv", header=True, inferSchema=True)` |
| `spark.read.json()` | Чтение JSON-файла | `path`, `multiLine` | `spark.read.json("file.json")` |
| `spark.read.parquet()` | Чтение Parquet-файла | `path` | `spark.read.parquet("file.parquet")` |

## Методы DataFrame - Основные операции

### Просмотр и инспекция данных

| Метод | Назначение | Возвращает | Пример |
|-------|-----------|------------|---------|
| `show()` | Показывает содержимое DataFrame | None | `df.show(10)` |
| `printSchema()` | Выводит схему данных | None | `df.printSchema()` |
| `count()` | Подсчитывает количество строк | Integer | `df.count()` |
| `columns` | Список имен столбцов | List[str] | `df.columns` |
| `dtypes` | Список пар (имя столбца, тип) | List[Tuple] | `df.dtypes` |
| `describe()` | Статистическая сводка | DataFrame | `df.describe().show()` |
| `head()` | Первые n строк | Row или List[Row] | `df.head(5)` |
| `take()` | Берет n строк | List[Row] | `df.take(3)` |
| `first()` | Первая строка | Row | `df.first()` |

### Выборка и фильтрация

| Метод | Назначение | Возвращает | Пример |
|-------|-----------|------------|---------|
| `select()` | Выбирает столбцы | DataFrame | `df.select("col1", "col2")` |
| `filter()` / `where()` | Фильтрация строк | DataFrame | `df.filter(df.age > 18)` |
| `distinct()` | Уникальные строки | DataFrame | `df.distinct()` |
| `drop()` | Удаляет столбцы | DataFrame | `df.drop("col1")` |
| `dropDuplicates()` | Удаляет дубликаты | DataFrame | `df.dropDuplicates(["col1"])` |
| `limit()` | Ограничивает количество строк | DataFrame | `df.limit(100)` |
| `sample()` | Выборка случайных строк | DataFrame | `df.sample(0.1)` |

### Преобразование данных

| Метод | Назначение | Возвращает | Пример |
|-------|-----------|------------|---------|
| `withColumn()` | Добавляет/заменяет столбец | DataFrame | `df.withColumn("new", df.col * 2)` |
| `withColumnRenamed()` | Переименовывает столбец | DataFrame | `df.withColumnRenamed("old", "new")` |
| `cast()` | Преобразует тип данных | Column | `df["col"].cast("int")` |
| `alias()` | Псевдоним для столбца | Column | `df.col.alias("new_name")` |

### Агрегация и группировка

| Метод | Назначение | Возвращает | Пример |
|-------|-----------|------------|---------|
| `groupBy()` | Группировка данных | GroupedData | `df.groupBy("category")` |
| `agg()` | Агрегатные функции | DataFrame | `df.agg({"col": "avg"})` |
| `orderBy()` / `sort()` | Сортировка | DataFrame | `df.orderBy("col")` |
| `sort()` | Сортировка | DataFrame | `df.sort(df.col.desc())` |

### Методы GroupedData

| Метод | Назначение | Пример |
|-------|-----------|---------|
| `count()` | Подсчет в группах | `grouped.count()` |
| `sum()` | Сумма в группах | `grouped.sum("col")` |
| `avg()` / `mean()` | Среднее в группах | `grouped.avg("col")` |
| `max()` | Максимум в группах | `grouped.max("col")` |
| `min()` | Минимум в группах | `grouped.min("col")` |

### Операции с несколькими DataFrame

| Метод | Назначение | Пример |
|-------|-----------|---------|
| `union()` | Объединение DataFrame | `df1.union(df2)` |
| `join()` | Соединение таблиц | `df1.join(df2, on="key")` |

## Функции из pyspark.sql.functions

### Строковые функции

| Функция | Назначение | Пример |
|---------|-----------|---------|
| `concat()` | Конкатенация строк | `f.concat(col1, col2)` |
| `substring()` | Подстрока | `f.substring(col, 1, 3)` |
| `trim()` | Удаление пробелов | `f.trim(col)` |
| `lower()` / `upper()` | Регистр символов | `f.lower(col)` |
| `length()` | Длина строки | `f.length(col)` |
| `split()` | Разделение строки | `f.split(col, ",")` |
| `regexp_extract()` | Регулярные выражения | `f.regexp_extract(col, pattern, 1)` |

### Числовые функции

| Функция | Назначение | Пример |
|---------|-----------|---------|
| `abs()` | Абсолютное значение | `f.abs(col)` |
| `sqrt()` | Квадратный корень | `f.sqrt(col)` |
| `round()` | Округление | `f.round(col, 2)` |
| `log()` | Логарифм | `f.log(col)` |
| `exp()` | Экспонента | `f.exp(col)` |

### Агрегатные функции

| Функция | Назначение | Пример |
|---------|-----------|---------|
| `count()` | Подсчет | `f.count(col)` |
| `sum()` | Сумма | `f.sum(col)` |
| `avg()` | Среднее | `f.avg(col)` |
| `mean()` | Среднее | `f.mean(col)` |
| `min()` | Минимум | `f.min(col)` |
| `max()` | Максимум | `f.max(col)` |
| `stddev()` | Стандартное отклонение | `f.stddev(col)` |
| `variance()` | Дисперсия | `f.variance(col)` |

### Дата-время функции

| Функция | Назначение | Пример |
|---------|-----------|---------|
| `current_date()` | Текущая дата | `f.current_date()` |
| `current_timestamp()` | Текущая метка времени | `f.current_timestamp()` |
| `date_format()` | Форматирование даты | `f.date_format(col, "yyyy-MM-dd")` |
| `year()` / `month()` / `day()` | Извлечение частей даты | `f.year(col)` |
| `datediff()` | Разница в днях | `f.datediff(col1, col2)` |

### Условные функции

| Функция | Назначение | Пример |
|---------|-----------|---------|
| `when()` | Условное выражение | `f.when(col > 0, "positive")` |
| `otherwise()` | Иначе в when | `.otherwise("negative")` |
| `coalesce()` | Первое не-NULL значение | `f.coalesce(col1, col2, "default")` |
| `isnull()` | Проверка на NULL | `f.isnull(col)` |

### Колоночные операции

| Функция | Назначение | Пример |
|---------|-----------|---------|
| `col()` | Ссылка на столбец | `f.col("column_name")` |
| `lit()` | Константное значение | `f.lit("constant")` |
| `array()` | Создание массива | `f.array(col1, col2)` |

## Типы данных из pyspark.sql.types

| Тип данных | Описание | Пример |
|------------|----------|---------|
| `StringType()` | Строковый тип | `StringType()` |
| `IntegerType()` | Целочисленный | `IntegerType()` |
| `LongType()` | Длинное целое | `LongType()` |
| `DoubleType()` | Число с плавающей точкой | `DoubleType()` |
| `FloatType()` | Число с плавающей точкой (32 бита) | `FloatType()` |
| `DecimalType()` | Десятичное число | `DecimalType(10, 2)` |
| `BooleanType()` | Логический тип | `BooleanType()` |
| `DateType()` | Дата | `DateType()` |
| `TimestampType()` | Дата и время | `TimestampType()` |
| `ArrayType()` | Массив | `ArrayType(StringType())` |
| `StructType()` | Структура | `StructType([StructField(...)])` |
| `StructField()` | Поле структуры | `StructField("name", StringType())` |

## Создание схемы

| Компонент | Назначение | Пример |
|-----------|-----------|---------|
| `StructType()` | Определяет схему DataFrame | `StructType([...])` |
| `StructField()` | Определяет поле в схеме | `StructField("col", StringType(), True)` |

## Методы записи данных

| Метод | Назначение | Пример |
|-------|-----------|---------|
| `write.csv()` | Запись в CSV | `df.write.csv("output")` |
| `write.parquet()` | Запись в Parquet | `df.write.parquet("output")` |
| `write.json()` | Запись в JSON | `df.write.json("output")` |
| `write.mode()` | Режим записи | `.mode("overwrite")` |
| `write.saveAsTable()` | Сохранение как таблицы | `.saveAsTable("table_name")` |

## Режимы записи (Write Modes)

| Режим | Описание |
|-------|----------|
| `"overwrite"` | Перезаписать существующие данные |
| `"append"` | Добавить к существующим данным |
| `"ignore"` | Пропустить, если данные существуют |
| `"error"` или `"errorifexists"` | Ошибка, если данные существуют (по умолчанию) |

## Трансформации и действия (Transformations vs Actions)

### Трансформации (ленивые операции)
- `select()`, `filter()`, `groupBy()`, `orderBy()`, `withColumn()`
- Не выполняются сразу, создают план выполнения

### Действия (выполняются немедленно)
- `show()`, `count()`, `collect()`, `take()`, `save()`, `write()`
- Запускают вычисления и возвращают результат

## Операторы сравнения для Column

| Оператор | Назначение | Пример |
|----------|-----------|---------|
| `==` | Равенство | `df.col == 10` |
| `!=` | Неравенство | `df.col != 10` |
| `<` | Меньше | `df.col < 10` |
| `>` | Больше | `df.col > 10` |
| `<=` | Меньше или равно | `df.col <= 10` |
| `>=` | Больше или равно | `df.col >= 10` |
| `&` | Логическое И | `(df.col1 > 0) & (df.col2 < 10)` |
| `\|` | Логическое ИЛИ | `(df.col1 > 0) \| (df.col2 < 10)` |
| `~` | Логическое НЕ | `~(df.col == 10)` |

## Сортировка

| Метод | Назначение | Пример |
|-------|-----------|---------|
| `asc()` | Сортировка по возрастанию | `df.col.asc()` |
| `desc()` | Сортировка по убыванию | `df.col.desc()` |

## Полезные константы

| Константа | Значение | Назначение |
|-----------|----------|-----------|
| `f.lit(None)` | NULL | Создание NULL значения |
| `f.lit(True)` / `f.lit(False)` | Boolean | Булевы константы |

## Оптимизация работы

| Метод | Назначение | Пример |
|-------|-----------|---------|
| `cache()` | Кэширование DataFrame | `df.cache()` |
| `persist()` | Сохранение в памяти/диске | `df.persist()` |
| `unpersist()` | Освобождение кэша | `df.unpersist()` |
| `repartition()` | Изменение количества партиций | `df.repartition(10)` |
| `coalesce()` | Уменьшение партиций | `df.coalesce(2)` |

## Работа с пропущенными значениями

| Метод | Назначение | Пример |
|-------|-----------|---------|
| `na.drop()` | Удаление строк с NULL | `df.na.drop()` |
| `na.fill()` | Заполнение NULL значений | `df.na.fill(0)` |
| `na.replace()` | Замена значений | `df.na.replace(old, new)` |

## Статистические функции

| Метод | Назначение | Пример |
|-------|-----------|---------|
| `stat.cov()` | Ковариация | `df.stat.cov("col1", "col2")` |
| `stat.corr()` | Корреляция | `df.stat.corr("col1", "col2")` |
| `stat.freqItems()` | Частые элементы | `df.stat.freqItems(["col1"])` |

Эта таблица охватывает основные методы и функции PySpark, которые используются в типичных задачах обработки данных. Для более подробной информации всегда обращайтесь к [официальной документации Spark](https://spark.apache.org/docs/latest/api/python/reference/pyspark.sql.html).