#ifndef STOPPING_CRITERION_H
#define STOPPING_CRITERION_H
#include <iostream>
#include <algorithm>
#include <stdio.h>
#include <cstdlib>
#include <math.h> 

using namespace std;

bool stoppingCS2(double temp,double min_temp);
bool stoppingCS9(int countFromNewSolution, int maxCountFromNewSolution);
#endif