#ifndef MAIN_S3E2_H
#define MAIN_S3E2_H



#include <iostream>
#include <cmath>
#include <ctime>
#include <cstdlib>
#include <cstdint>
#include <stdio.h>
#include <sstream>
#include <random>
#include <fstream>
#include <iomanip>
#include <chrono>
#include <iostream>
#include <string>

using namespace std;

///////////////////////////////////////////////////
/// Estructura de datos de los colegios.
///////////////////////////////////////////////////
///////////////////////////////////////////////////
/// Estructura de datos de los colegios.
///////////////////////////////////////////////////
struct Info_colegio{
    double latitude = 0.0;
    double longitude = 0.0;
    int num_alu = 0;
    int rbd = 0;
    int prioritario = 0;
};
///////////////////////////////////////////////////
/// Estructura de alumnos
///////////////////////////////////////////////////
struct Info_alu{
    int rbd = 0;
    int sep = 0;
    double latitude = 0.0;
    double longitude = 0.0;
};





///////////////////////////////////////////////////
/// Funciones generales
///////////////////////////////////////////////////
double sasFunc(double t,double cRate, int len1, int len2, bool seedRandom);
double calCosto(int currentSolution[], double **distMat, const double ptr_alpha[], int alumnosSep[], int totalVuln, int cupoArray[]);
double meanDist(const int currentSolution[], double  **distMat);
double S(const int currentSolution[],const int alumnosSep[], int totalVuln);
double costCupo(const int currentSolution[],const int cupoArray[]);
void newSolution(int currentSolution[],const int previousSolution[]);
double newSolution_v2(int n_students,int n_colegios,int totalVuln,int aluxcol[],int aluVulxCol[],int cupoArray[],double **distMat, int currentSolution[],const double ptr_alpha[]);
void assignSchoolToArray(int previousSolution[], int bestSolution[], int currentSolution[], Info_colegio *ptr_colegios, Info_alu *ptr_students, int cupoArray[]);
void calcDist(Info_colegio *ptr_colegios, Info_alu *ptr_students, double **distMat);
void shuffle(int[],int,std::uniform_int_distribution<int>);
void getDataSchool(std::vector<Info_colegio> &colegios);
void getDataStudents(std::vector<Info_alu> &students, int &totalVuln);
double getMaxDistance(double **distMat);
void normalizedAlpha(double alpha[3]);
void initializeArray(int *aluxcol, int *previousAluxCol, int *bestAluxCol, int *aluVulxCol, int *previousAluVulxCol, int *bestAluVulxCol, int *alumnosSep, std::vector<Info_alu> &students,std::vector<Info_colegio> &colegios);


#endif


