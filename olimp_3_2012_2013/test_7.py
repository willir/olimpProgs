#!/usr/bin/env python

import random
import math

MIN_CORD = -10 ** 4
MAX_CORD = 10 ** 4
MIN_N = 2
MAX_N = 2000
MAXR = 1000

class Point:
    x=0.0
    y=0.0
    
    def __init__(self, x, y):
        self.x = x;
        self.y = y;

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __hash__(self):
        return hash(self.x + self.y)

    def __str__(self):
        return str(self.x) + ' ' + str(self.y)

    def __repr__(self):
        return self.__str__();



def genRandPoint(x0, y0, r, n):
    '''
    @param x0: X coordinate of the circle center
    @param y0: Y coordinate of the circle center
    @param r:  Radius
    @param n:  Number of coordinates which will have been generated
    @return: set of coordinates
    '''
    ret = set();
    while len(ret) < n:
        phi = random.random() * 2 * math.pi;
        ret.add(Point(x0 + r * math.cos(phi), y0 + r * math.sin(phi)))

    return ret;

random.seed();

r1 = random.randint(5, MAXR)
r2 = random.randint(5, MAXR)

isCirclCross = bool(random.randint(0, 1))

#isCirclCross = False

x1 = random.randint(MIN_CORD + r1, MAX_CORD - r1)
y1 = random.randint(MIN_CORD + r1, MAX_CORD - r1)

if isCirclCross:
    minX2 = max(math.ceil( x1 - math.sqrt(r1 ** 2 / 2) - r2), MIN_CORD + r2)
    minY2 = max(math.ceil( y1 - math.sqrt(r1 ** 2 / 2) - r2), MIN_CORD + r2)
    maxX2 = min(math.floor(x1 + math.sqrt(r1 ** 2 / 2) + r2), MAX_CORD - r2)
    maxY2 = min(math.floor(y1 + math.sqrt(r1 ** 2 / 2) + r2), MAX_CORD - r2)
else:
    minY2 = minX2 = MIN_CORD + r2
    maxY2 = maxX2 = MAX_CORD - r2


x2 = random.randint(minX2, maxX2)
y2 = random.randint(minY2, maxY2)

print str(x1) + ':' + str(y1) + ':' + str(r1) + ' ' + str(x2) + ':' + str(y2) + ':' + str(r2)

n = random.randint(MIN_N, MAX_N)

n = 2000

n1 = random.randint(MIN_N, n)
n2 = random.randint(MIN_N, n - n1)

print n1, n2

set1 = genRandPoint(x1, y1, r1, n1);
set2 = genRandPoint(x2, y2, r2, n2);

totalList = list(set1 | set2);

random.shuffle(totalList)


with open('circles.in', 'w') as f:
    f.write(str(len(totalList)) + '\n')
    for coord in totalList:
        f.write(str(coord) + '\n')

#print r1, r2, x1, y1, x2, y2, isCirclCross

