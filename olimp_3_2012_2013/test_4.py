#!/usr/bin/env python

import random
import math

MIN_W = 1
MAX_W = 2*10**4

MIN_L = 1
MAX_L = 2*10**5

MIN_N = 100
MAX_N = 2000

MIN_A = 0
MAX_A = 10**5

def randRage(min, max, qty):
    res = list(set([random.randint(min, max) for r in xrange(qty)]))
    res.sort()
    return res

W = random.randint(MIN_W, MAX_W)
L = random.randint(MIN_L, MAX_L)

N = random.randint(MIN_N, MAX_N)
M = random.randint(MIN_N, MAX_N)

N = 500
M = 500

listN = randRage(MIN_A, MAX_A, N)
listM = randRage(MIN_A, MAX_A, M)

N = len(listN)
M = len(listM)

with open('birch.in', 'w') as f:
    f.write(str(L) + ' ' + str(W) + '\n')
    f.write(str(N) + '\n')
    f.write(' '.join(map(str, listN)) + '\n')
    f.write(str(M) + '\n')
    f.write(' '.join(map(str, listM)) + '\n')

