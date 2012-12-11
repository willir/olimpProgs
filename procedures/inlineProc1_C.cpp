
#include <time.h>
#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define CLOCKS_PER_MSEC (CLOCKS_PER_SEC / 1000)

static inline unsigned long add(unsigned long a, unsigned long b) {
    return a + b;
}

int main() {
    unsigned long ctr = 1;
    const unsigned long step = 2;
    clock_t bt, et;

    bt = clock();
    for(unsigned long i = 0; i < 50; i++) {
        char a[500] = {0};

        a[1] = ctr;
        a[2] = a[1] + 1;
#if 1
        ctr = ctr * step;
#else
        ctr = ctr + step;
#endif
    }
    et = clock();


    printf("ctr:%lu ULONG_MAX:%lu\n", ctr, ULONG_MAX);
    printf("elapsed time: %ld\n", (et - bt) / CLOCKS_PER_MSEC);

    return 0;
}

