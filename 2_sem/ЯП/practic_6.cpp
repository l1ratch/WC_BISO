#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    double n;
    scanf_s("%lf", &n); // Запрос количества чисел в массиве

    srand(time(NULL)); // Смена базы генератора rand
    int a[20];
    int i;
    for (i = 0; i < n; i++) {
        a[i] = rand() % 201 - 100; // Генерация чисел от -100 до 100
    }
    for (i = 0; i < (n - 1); i++) {
        for (int j = i + 1; j < n; j++) {
            if (a[i] > a[j]) {
                int b = a[i];
                a[i] = a[j];
                a[j] = b;
            }
        }
    }
    for (i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
    return 0;
}
