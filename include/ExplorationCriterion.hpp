#ifndef EXPLORATION_CRITERION_H
#define EXPLORATION_CRITERION_H

#include <iostream>
#include <algorithm>
#include <stdio.h>
#include <cstdlib>
#include <random>
#include <cstdint>
#include <cstring>

using namespace std;

extern std::mt19937 mt;
extern std::uniform_int_distribution<int> dist;
extern std::uniform_int_distribution<int> dist2;
extern double newSolution_v2(int n_students,int n_colegios,int totalVuln,int aluxcol[],int aluVulxCol[],int cupoArray[],double **distMat, int currentSolution[], const double ptr_alpha[]);
extern void shuffle(int values[], const int max_change, std::uniform_int_distribution<int> distri);

double solutionNE1(int n_students,
        int n_colegios,
        int totalVuln,
        int *aluxcol,
        int *aluVulxCol,
        int *cupoArray,
        double **distMat, 
        int *currentSolution,
        const double *ptr_alpha,
        int *shuffle_student,
        int *shuffle_colegios,
        int *alumnosSep);

double solutionNE3(int n_students,
        int n_colegios,
        int totalVuln,
        int *aluxcol,
        int *aluVulxCol,
        int *cupoArray,
        double **distMat, 
        int *currentSolution,
        const double *ptr_alpha,
        int *shuffle_student,
        int *shuffle_colegios,
        int *alumnosSep);
#endif