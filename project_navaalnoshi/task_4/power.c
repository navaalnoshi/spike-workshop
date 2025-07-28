#include <stdio.h>
int power(int x, int n) {
    int result = 1;

    for (int i = 0; i < n; i++) {
        result *= x;
    }

    return result;
}

int main() {
    int base, exponent;

    printf("Enter base (x): ");
    scanf("%d", &base);

    printf("Enter exponent (n): ");
    scanf("%d", &exponent);

    int result = power(base, exponent);
    printf("%d^%d = %d\n", base, exponent, result);

    return 0;
}
