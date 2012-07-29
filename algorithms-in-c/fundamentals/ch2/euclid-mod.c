#include <stdio.h>

int gcd(int u, int v) {
    int temp;
    while (u > 0) {
        if (u < v) {
            temp = u;
            u = v;
            v = temp;
        }
        u = u % v;
    }
    return v;
}

int main(void) {
    int x, y;
    while (scanf("%d %d", &x, &y) != EOF) {
        if (x > 0 && y > 0)
            printf("%d %d %d\n", x, y, gcd(x, y));
    }
}
