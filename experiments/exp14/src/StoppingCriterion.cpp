#include <StoppingCriterion.hpp>

bool stoppingCS2(double temp,double min_temp)
{
    return temp > min_temp;
}

bool stoppingCS9(int countFromNewSolution, int maxCountFromNewSolution)
{
    return countFromNewSolution < maxCountFromNewSolution;
}


