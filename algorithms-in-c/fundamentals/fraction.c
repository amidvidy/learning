#include <stdio.h>
#include <stdlib.h>
#include "euclid.c"

typedef struct frac_struct {
    int numerator;
    int denominator;
} frac_t;

void reduce(frac_t *frac) {
    int reducer;

    reducer = gcd(frac->numerator, frac->denominator);
    frac->numerator /= reducer;
    frac->denominator /= reducer;
}

frac_t * make_frac(int num, int denom) {
    frac_t *ret = malloc(sizeof(frac_t));
    ret->numerator = num;
    ret->denominator = denom;
    return ret;

}

void destroy_frac(frac_t *frac) {
    free(frac);
    frac = NULL;
}

void print_frac(frac_t *frac) {
    printf("%d / %d\n", frac->numerator, frac->denominator);
}

int main(void) {
    frac_t *f1 = make_frac(6, 8);
    print_frac(f1);
    reduce(f1);
    print_frac(f1);
    destroy_frac(f1);
}
