#include <sas.hpp>
#include <iostream>

///////////////////////////////////////////////////
///////////////////////////////////////////////////
using namespace std;

int main(int argc, char *argv[]) {
    double coolingRate = 0.9998; // Tasa de enfriamiento
    double temp = 100000; // Temperatura Inicial
    int len1 =1;// 0.00000009; // Minima temperatura que puede llegar
    int len2 = 2;
    bool randomSeed = false;
    
    double a = sasFunc(temp,coolingRate,len1,len2,randomSeed);
    return (EXIT_SUCCESS);

}
