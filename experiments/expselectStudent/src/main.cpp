#include <sas.hpp>
#include <iostream>
#include <algorithm>
#include <stdio.h>
#include <cstdlib>
#include <random>
#include <cstdint>
#include <cstring>

///////////////////////////////////////////////////
///////////////////////////////////////////////////
using namespace std;

int n_students, n_colegios;


///////////////////////////////////////////////////
/// Funciones generales
///////////////////////////////////////////////////

///////////////////////////////////////////////////
/// Parametros de configuración Default
///////////////////////////////////////////////////



double alpha1 = 15; // Alpha de distancia
double alpha2 = 30; // Alpha de segregación
double alpha3 = 25; // Alpha de costocupo
double coolingRate = 0.991; // Tasa de enfriamiento
double temp = 100000; // Temperatura inicial
double min_temp = 0.00000009; // Minima temperatura que puede llegar
int n_block = 32;
int n_thread = 32;
double max_temp = 0;
double k_recalentamiento = 0.90;
int seed = 12315;
int len1 =1;// 0.00000009; // Minima temperatura que puede llegar
int len2 = 2;


string ruta_save = "../save/"; // Ruta para guardar los archivos
double alpha[3]={alpha1,alpha2,alpha3}; // Valores del alpha con orden Distancia, Segregación, Costo Cupo
random_device rd;
mt19937 mt(rd());
uniform_int_distribution<int> dist(0,0);
uniform_int_distribution<int> dist2(0,0);
uniform_real_distribution<double> dist_accepta(0.0, 1.0);
double max_dist=0.0;
double min_dist=0.0;
double init_dist=0.0;

char timestr[20];

string prefijo_save;

int main(int argc, char *argv[]) {
    time_t hora_actual;
    struct tm * time_info;
    time(&hora_actual);
    time_info = localtime(&hora_actual);
    strftime(timestr, sizeof(timestr), "%Y-%m-%d T:%H-%M", time_info);
    prefijo_save = string(timestr);
    if (argc>1) {
        alpha1 = std::stod(argv[1]); // Alpha de distancia
        alpha2 = std::stod(argv[2]); // Alpha de segregación
        alpha3 = std::stod(argv[3]); // Alpha de costocupo
        alpha[0]=alpha1;
        alpha[1]=alpha2;
        alpha[2]=alpha3;
        coolingRate = std::stod(argv[4]); // Tasa de enfriamiento
        k_recalentamiento = std::stod(argv[5]);
        temp = std::stod(argv[6]); // Temperatura inicial
        min_temp = std::stod(argv[7]); // Minima temperatura que puede llegar
        n_block = std::stoi(argv[8]); // Numero de blockes = numeros de alumnos aleatorios
        n_thread = std::stoi(argv[9]); // Numero de threads por bloque = numeros de escuelas aleatorios
        ruta_save = argv[10];
        prefijo_save = argv[11];
        max_temp= pow(10,300);
        seed= std::stoi(argv[12]);
    }
    mt.seed(seed);
    
    double a = sasFunc();
    return (EXIT_SUCCESS);

}
