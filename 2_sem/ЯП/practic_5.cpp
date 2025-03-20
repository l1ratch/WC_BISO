#include <iostream>
#include <stdio.h>

int main()
{
    short u;
    short r;
    short w;
    short e;
    short x;
    int word;

    scanf_s("%hu", &u);
    scanf_s("%hu", &r);
    scanf_s("%hu", &w);
    scanf_s("%hu", &e);
    scanf_s("%hu", &x);

    word = (u & 0xFF) << 8;
    word |= (r & 1) << 7;
    word |= (w & 1) << 6;
    word |= (e & 1) << 5;
    word |= (x & 1) << 1;

    printf("\n");
    printf("%x\n", word);
    printf("\n");

    scanf_s("%x", &word);
    printf("\n");

    u = (word >> 8) & 0xFF;
    r = (word >> 7) & 1;
    w = (word >> 6) & 1;
    e = (word >> 5) & 1;
    x = (word >> 1) & 1;

    printf("%hu, %hu, %hu, %hu, %hu", u, r, w, e, x);
    return 0;
}