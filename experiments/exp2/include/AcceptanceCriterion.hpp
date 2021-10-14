#ifndef ACCEPTANCE_CRITERION_H
#define ACCEPTANCE_CRITERION_H

#include <iostream>
#include <algorithm>
#include <cstdlib>
#include <random>

using namespace std;

extern mt19937 mt;
extern int seed;
extern double temp;
int metropolisAC1(double costPrevious, double costCurrent,uniform_real_distribution<double> dist);
int metropolisAC3(double costPrevious, double costCurrent);
int dCriteriaAC6(double costPrevious, double costCurrent);
double p(double costPrevious,double costCurrent);

#endif