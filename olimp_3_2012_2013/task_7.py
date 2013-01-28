#!/usr/bin/env python

import random
import math

EPS = 0.001

def fEq(f1, f2):
    return abs(f1 - f2) < EPS

class Point:
    x=0.0
    y=0.0
    index=0

    @classmethod
    def from_string(cls, string, index):
        (x, y) = map(float, string.split())
        return cls(x, y, index);

    def __init__(self, x, y, index):
        self.x = float(x);
        self.y = float(y);
        self.index = index;

    @staticmethod
    def isPerpendicular(p1, p2, p3):
        '''
        Check the given point are perpendicular to x or y axis 
        '''

        # checking whether the line of the two pts are vertical
        if fEq(p2.x, p1.x) and fEq(p3.y, p2.y):
            #The points are perpendicular and parallel to x-y axis
            return False

        if fEq(p2.y, p1.y) or fEq(p3.y, p2.y) or fEq(p2.x, p1.x) or fEq(p3.x, p2.x):
            return True
        else:
            return False

    def distanceToSqr(self, other):
        '''
        @return: squared distance.
        '''
#        return math.sqrt((self.x - other.x)**2 + (self.y - other.y)**2);
        return (self.x - other.x)**2 + (self.y - other.y)**2;

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y
    
    def __lt__(self, other):
        if not fEq(self.x, other.x):
            return self.x < other.x;
        else:
            return self.y < other.y;

    def __hash__(self):
        return hash(self.x + self.y)

    def __str__(self):
        return str(self.x) + ':' + str(self.y)

    def __repr__(self):
        return self.__str__();

    def setIndex(self, index):
        self.index = index;

class Circle:

    center = None
    r = -1.0

    def __init__(self, p1, p2, p3):

        self.center = Point(0.0, 0.0, -1.0)

        if not Point.isPerpendicular(p1, p2, p3):
            self.calcCircle(p1, p2, p3);    
        elif not Point.isPerpendicular(p1, p3, p2):
            self.calcCircle(p1, p3, p2);    
        elif not Point.isPerpendicular(p2, p1, p3):
            self.calcCircle(p2, p1, p3);    
        elif not Point.isPerpendicular(p2, p3, p1):
            self.calcCircle(p2, p3, p1);    
        elif not Point.isPerpendicular(p3, p2, p1):
            self.calcCircle(p3, p2, p1);    
        elif not Point.isPerpendicular(p3, p1, p2):
            self.calcCircle(p3, p1, p2);    
        else:
            self.r = -1;

    def calcCircle(self, p1, p2, p3):

        yDelta_a = p2.y - p1.y;
        xDelta_a = p2.x - p1.x;
        yDelta_b = p3.y - p2.y;
        xDelta_b = p3.x - p2.x;

        if fEq(p2.x, p1.x) and fEq(p3.y, p2.y):
            self.center.x= 0.5*(p2.x + p3.x)
            self.center.y= 0.5*(p1.y + p2.y)
            self.r= self.center.distanceToSqr(p1)
            return;

        # IsPerpendicular() assure that xDelta(s) are not zero
        aSlope = yDelta_a / xDelta_a; 
        bSlope = yDelta_b / xDelta_b;
        if fEq(aSlope, bSlope):    #checking whether the given points are colinear.
#            print 'FAIL on', p1, ':', p2, ':', p3, '.', aSlope, bSlope
#            print yDelta_a, xDelta_a, yDelta_b, xDelta_b
            return;

        # calc center
        numerator = aSlope*bSlope*(p1.y - p3.y) + bSlope*(p1.x + p2.x) - aSlope*(p2.x+p3.x);
        denominator = 2 * (bSlope-aSlope);
        self.center.x= numerator / denominator;
        self.center.y = -1 * (self.center.x - (p1.x+p2.x)/2) / aSlope + (p1.y + p2.y) / 2;

        self.r= self.center.distanceToSqr(p1)

    def containPoint(self, p):
        return fEq(self.r, p.distanceToSqr(self.center));

    def __str__(self):
        return str(self.center) + ':' + str(self.r);


def printRes(list1, list2):
    with open('circles.out', 'w') as f:
        for coord in list1:
            f.write(str(coord.index) + ' ')
        f.write('\n')
        for coord in list2:
            f.write(str(coord.index) + ' ')
        f.write('\n')

def processTrivial(inList):
    '''
    Process trivial case.
    @param inList: input inList.
    @return: (isTrivial, list1, list2)
              isTrivial: is this tivial case.
              list1: empty if !isTrivial, otherwise inList of first  circle point
              list2: empty if !isTrivial, otherwise inList of second circle point 
    '''
    if len(inList) > 4:
        return (False, [], [])
    else:
        return (True, inList[:len(inList)/2], inList[len(inList)/2:])

def listAllTriple(inList):
    for i in xrange(len(inList) - 2):
        for j in xrange(i + 1, len(inList) - 1):
            for k in xrange(j + 1, len(inList)):
                yield [inList[i], inList[j], inList[k]];

def splitPointByCircles(circle1, inList):
    '''
    @param circle1: First circle.
    @param inList: List of all point
    @return: (list1, list2)
             list1: inList of all point which belong to the first  circle, 
                    or empty inList if it wrong circle
             list2: inList of all point which belong to the second circle, 
                    or empty inList if it wrong circle 
    '''
    list1 = []
    list2 = []

    for point in inList:
        if not circle1.containPoint(point):
            list2.append(point);
        else:
            list1.append(point);
        if len(list2) == 3:
            break;

    if len(list2) < 3:
        return (list1, list2)

    circle2 = Circle(list2[0], list2[1], list2[2]);
    list1 = [];
    list2 = [];

    for point in inList:
        inSecond = inFirst = False;

        if circle1.containPoint(point):
            inFirst = True;
            list1.append(point);
        if circle2.containPoint(point):
            inSecond = True;
            list2.append(point);

        if not inFirst and not inSecond:
            print point, 'not in', circle1, 'and', circle2
            return ([], []);

    print circle1, circle2;
    return (list1, list2);

def getListFive(inList):
    return inList[0:5];
#    minPoint = min(inList);
#    
#    inList.sort(cmp=lambda p1, p2: int(minPoint.distanceToSqr(p1) - minPoint.distanceToSqr(p2)))
#    return inList[0:5];
#    return inList[0::len(inList)/5 + 1]


inList = []

with open('circles.in', 'r') as f:    
    n = int(f.readline())
    for i in xrange(n):
        inList.append(Point.from_string(f.readline(), i + 1));

(isTrivial, listRes1, listRes2) = processTrivial(inList);
if isTrivial:
    printRes(listRes1, listRes2);
    exit(0);

listFive = getListFive(inList);
#if len(listFive) != 5:
#    raise Exception('len(listFive):' + str(len(listFive)) + ' != 5')

for (p1, p2, p3) in listAllTriple(listFive):
    circle = Circle(p1, p2, p3);
    if circle.r == -1:
#        print 'FAIL1'
        continue;

    (listRes1, listRes2) = splitPointByCircles(circle, inList);
    if listRes1:
        printRes(listRes1, listRes2);
        break;


#print inList;
