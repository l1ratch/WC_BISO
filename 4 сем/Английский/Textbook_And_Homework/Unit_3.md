### **Перевод текстов из Unit 3: Programming Languages**

---

#### **TEXT A. How computers process information**  
Компьютеры постоянно обрабатывают огромные объемы информации. Работа с компьютером включает отправку и получение сложных наборов инструкций. Машинный язык состоит из двоичных цифр, которые представлены числами 0 и 1. Каждая возможная компьютерная операция кодируется различными комбинациями этих двух чисел.  

Однако программисты обычно не отправляют команды на машинном языке. Они пишут программное обеспечение на языках программирования, понятных человеку. Эти языки, такие как C и Java, ближе к способу мышления человека. Однако компьютеры всё равно требуют инструкций на машинном языке.  

Системное программное обеспечение облегчает это взаимодействие внутри компьютера. Этот язык проще, чем язык, понятный человеку, но он всё ещё использует буквы и слова. Компьютеру нужен ассемблер для преобразования этих инструкций в двоичную форму.  

Например, программист может написать команду "A + B". Затем компилятор переводит её в язык ассемблера: "Add A, B". Наконец, ассемблер преобразует её в машинный код: "1000110010100000".  

---

#### **TEXT B. Programming Languages**  
К сожалению, компьютеры не могут понимать устный английский или другие естественные языки. Единственный язык, который они понимают напрямую, — это машинный код, состоящий из 1 и 0 (двоичный код).  

Однако писать программы на машинном коде слишком сложно. Поэтому для общения с компьютером используются символьные языки. Например, языки ассемблера используют аббревиатуры, такие как ADD, SUB, MUL, чтобы обозначить инструкции. Программа затем переводится в машинный код с помощью программы под названием ассемблер.  

Машинный код и языки ассемблера называются языками низкого уровня, так как они ближе к "железу". Они довольно сложны и ограничены определёнными машинами. Чтобы упростить написание программ и устранить проблему несовместимости между различными типами компьютеров, разработчики программного обеспечения создали языки высокого уровня, которые ближе к английскому языку.  

Вот несколько примеров.  

- **FORTRAN (FORmula TRANslator)**: Один из первых языков высокого уровня, разработанный IBM в середине 1950-х годов для научных и инженерных вычислений.  
- **BASIC (Beginner's All-purpose Symbolic Instruction Code)**: Разработан в 1960-х годах как простой язык для начинающих.  
- **PASCAL**: Популярен с 1970-х годов и широко используется для обучения основам программирования.  
- **C**: Разработан в 1970-х годах Деннисом Ритчи в Bell Labs. Подходит для системного программирования.  
- **C++**: Расширение C, поддерживающее объектно-ориентированное программирование (ООП).  
- **Java**: Разработан в 1995 году в Sun Microsystems для использования в Интернете. Использовался для создания Java-апплетов — небольших программ с анимацией и интерактивными функциями.  
- **Python**: Создан в 1989 году, он выделяется простотой и читаемостью. Используется для веб-разработки, анализа данных и искусственного интеллекта.  

Программы, написанные на языках высокого уровня, должны быть переведены в машинный код с помощью компилятора или интерпретатора. Компилятор переводит исходный код в объектный код целиком, а интерпретатор переводит код построчно во время выполнения программы.  

---

Теперь приступлю к выполнению заданий из юнита 3.

### **Решение заданий из Unit 3: Programming Languages**

---

#### **Task 1. Lead-in questions.**

1. **How do you think we can classify programming languages?**  
   Programming languages can be classified into low-level languages (machine code, assembly language) and high-level languages (FORTRAN, Java, Python). They can also be grouped based on their paradigms, such as procedural, object-oriented, and functional languages.

2. **What are the most common programming languages nowadays?**  
   Common languages include Python, JavaScript, Java, C++, and C#.

3. **What programming languages are rarely used these days?**  
   Older languages like COBOL, ALGOL, and Assembly are now rarely used.

---

#### **Task 2. Translate the terms into Russian and define them in English.**

a) **Assembler** – Ассемблер.  
   *Definition*: A program that translates assembly language into machine code.  

b) **Binary code** – Двоичный код.  
   *Definition*: A language consisting of only 0s and 1s, used by computers.  

c) **Compatible** – Совместимый.  
   *Definition*: Able to work with other systems or software without conflict.  

d) **Compiler** – Компилятор.  
   *Definition*: A program that converts high-level code into machine code.  

e) **Debugging** – Отладка.  
   *Definition*: The process of finding and fixing errors in code.  

f) **Encapsulation** – Инкапсуляция.  
   *Definition*: An OOP principle where data and methods are bundled into one unit.  

g) **High-level language** – Язык высокого уровня.  
   *Definition*: A language closer to human language, like Python or Java.  

h) **Inheritance** – Наследование.  
   *Definition*: An OOP concept where one class can use properties of another.  

i) **Interpreter** – Интерпретатор.  
   *Definition*: A program that translates and executes code line by line.  

j) **Low-level language** – Язык низкого уровня.  
   *Definition*: A language close to machine language, such as Assembly.  

k) **Machine code** – Машинный код.  
   *Definition*: Binary instructions directly executed by a computer.  

l) **OOP** – Объектно-ориентированное программирование (ООП).  
   *Definition*: A programming paradigm based on objects and their interactions.  

m) **Polymorphism** – Полиморфизм.  
   *Definition*: An OOP concept where the same method can behave differently for different objects.  

n) **Source code** – Исходный код.  
   *Definition*: Human-readable code written by programmers.  

---

#### **Task 3. Place sentences in the correct order for Text A.**

1. A compiler is a software component that translates human-readable language into an assembly language.  
2. They write software in human-readable programming languages.  
3. The computer uses these instructions to perform the command.  
4. Computers have their own language, called machine language.  

---

#### **Task 4. Translate Text B into Russian and answer the questions.**

**Ответы на вопросы:**

1. **What is the difference between high-level and low-level programming languages?**  
   High-level languages are closer to human language and easier to use. Low-level languages are closer to machine code and are hardware-specific.  

2. **What is the difference between the assembler, compiler, and interpreter?**  
   - An assembler translates assembly language into machine code.  
   - A compiler converts the entire program into machine code at once.  
   - An interpreter translates and executes code line by line.  

3. **Which language is widely used for systems programming?**  
   The C language is widely used for systems programming.  

4. **What does FORTRAN stand for?**  
   FORTRAN stands for "FORmula TRANslator".  

5. **What are Java applets?**  
   Java applets are small programs designed to provide animation and interactivity on web pages.  

---

#### **Task 5. Complete the text with the missing prepositions.**

1. **into**  
2. **between**  
3. **out**  
4. **with**  
5. **of**  
6. **of**  
7. **in**  
8. **to**  
9. **above**  
10. **Unlike**  
11. **to**  
12. **for**  
13. **into**  
14. **to**  
15. **to**  
16. **of**  
17. **of**  
18. **of**  
19. **for**  

---

#### **Task 6. Video-based ranking of programming languages.**

1. **Swift** – Developed by Apple to replace Objective-C.  
2. **C and C++** – Called the "mother of all programming languages".  
3. **JavaScript** – Changed how websites work, enabling dynamic content.  
4. **Java** – Platform-independent and widely used for applications.  
5. **Python** – Known for its simplicity and versatility in AI and data analysis.  

---

#### **Task 7. Questions to Text D (Object-Oriented Programming):**

1. **What are the advantages of using object-oriented programming?**  
   It enables code reuse, easier maintenance, and faster development of programs.  

2. **What are the three key features of OOP?**  
   Encapsulation, inheritance, and polymorphism.  

3. **What is encapsulation?**  
   Encapsulation bundles data and program instructions into objects.  

4. **What is inheritance?**  
   It allows a class to use the properties and methods of another class.  

5. **What is polymorphism?**  
   It enables different objects to respond to the same method in different ways.  

6. **What multimedia data types are referred to in the text?**  
   Sound, video, text, and graphics.  

7. **List the different types of triangle mentioned in the text.**  
   Right, equilateral, and isosceles triangles.  

8. **What specific type of rectangle is named in the text?**  
   A square.  

9. **What common properties of a rectangle are mentioned in the text?**  
   It has 4 sides and 4 right angles.  

10. **What can be made quicker by code reusability?**  
    Program development and maintenance.  

---

### **Task 8. Match the terms with their definitions:**

1. **Object** – e) A module containing data and program instructions.  
2. **Encapsulation** – a) An OOP property that allows data and program instructions to be bundled into an object.  
3. **Menu** – b) A list of choices.  
4. **Square** – f) A rectangle with equal sides.  
5. **Polymorphism** – c) An OOP property that enables different objects to deal with the same instruction in different ways.  
6. **Library** – d) A reusable collection of objects.  

---

### **Task 9. Complete the text using words from Text D.**

**Ответ:**  
Encapsulation, (1) **inheritance**, and polymorphism are key features of (2) **object-oriented** programming. Encapsulation allows data and program instructions to be bundled together into (3) **objects** called objects. Inheritance means that specific (4) **instances** of a class of objects (5) **inherit** the properties of the class of objects. Polymorphism means that instructions are treated differently by different (6) **objects**. The combination of these (7) **three** features of OOP means that program code is reusable. This speeds up (8) **development** and (9) **maintenance** of programs.  

---

### **Task 10. Listen to the recording and match years and phrases.**

**Ответ:**  
- **1990** – The initial concept of Java was developed.  
- **Sun Microsystems** – The company that created Java.  
- **Handheld device** – The initial target platform for Java.  
- **Oak** – Java's original name.  
- **Duke** – The official mascot of Java.  
- **1993** – The year when Java’s potential for the web was realized.  
- **May 1995** – The official release of Java.  
- **Animation and interactive programs** – Features Java brought to web development.  
- **Multiple platforms** – Java’s key strength due to its platform independence.  

---

### **Task 11. Complete the text by modifying the given words.**

1. **Intended**  
2. **Variety**  
3. **Nearly**  
4. **Applications**  
5. **Functionality**  
6. **Once**  
7. **Written**  
8. **Independent**  

---

### **Task 12. Match the terms with their definitions.**

1. **Assembler** – A program that converts assembly language into machine code.  
2. **Binary code** – A code made of just two numbers (0 and 1).  
3. **Assembly language** – A low-level language using symbols to represent instructions.  
4. **Compiler** – A program that converts high-level code into object code in one go.  
5. **Inheritance** – The ability of one class to use the properties of another.  
6. **Object-oriented language** – A high-level language allowing object-based programming.  
7. **Interpreter** – A program that translates and executes code line by line.  
8. **Encapsulation** – Bundling data and methods into one unit.  
9. **Source code** – Program instructions written in a readable form.  
10. **Debugging** – The process of finding and fixing errors in code.  
11. **Compatible** – Capable of working across different platforms.  

---

### **Task 13. Fill in the gaps with correct prepositions.**

1. **Into**  
2. **Than**  
3. **For**  
4. **With**  
5. **Unlike**  
6. **By**, **of**  
7. **To**  

---

### **Task 14. Render the article into English.**

**Java Language Creation:**  
The Java language was created by Sun Microsystems in 1992. Initially, it was designed for platform-independent programming of processors embedded in various household devices.  

The main drawback of existing programming languages at that time was their orientation towards specific processors. Even high-level languages, which theoretically allowed creating programs for any processor, required a corresponding compiler that generated output code for the target processor. The long-standing "dream" of all programmers to write a program once and use it across different processors and operating systems had not yet been realized. This dream was what the developers of Java aimed to fulfill.  

Interestingly, they unknowingly created something much greater than originally intended. Independently of Java's creation, the Internet was developing rapidly. It turned out that the ideas embedded in Java solved many problems associated with web programming. Instead of a narrowly specialized programming language for embedded processors, they created a universal one that enabled platform-independent programs with support for modern technologies. This universal programming language was officially introduced by Sun Microsystems for commercial use.  

---

### **Task 15. Render the article into English.**

**About Python:**  
Python is a high-level object-oriented language created by Dutch developer Guido van Rossum in 1991. It has become one of the most popular languages today. Python is used by major companies like Google, Facebook, IBM, and NASA.  

Python is an interpreted language, meaning its code is not compiled; instead, it is translated into machine code by an interpreter. This allows Python code to run on any platform with an installed interpreter. However, this also means that Python programs are slower and require more memory compared to compiled languages like C or C++.  

Python is widely used for data analysis, web development, and even game development. Thanks to its readability, simple syntax, and lack of need for compilation, Python is excellent for teaching programming, allowing students to focus on algorithms, concepts, and paradigms.  
