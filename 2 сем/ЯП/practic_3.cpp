#include <iostream>
#include <math.h>

using namespace std;

int main()
{
    double x, y, z, f;
    scanf_s("%lf %lf %lf", &x, &y, &z);
    z = z * pow(10.0, -4.0);

    double b = x + 3.0 * abs(x - y) + pow(x, 2);
    double c = abs(x - y) * z + pow(x, 2);

    if (c == 0) { printf("error\n"); return 0; }                      // Закоментируй для обхода проверки
    if ((x >= -1) and (x <= 1)) { printf("error\n"); return 0; }      // Закоментируй для обхода проверки

    f = 5.0 * atan(x) - (1.0/4.0) * acos(x) * (b/c);

    printf("%10.5lf", f);
    return 0;
}

