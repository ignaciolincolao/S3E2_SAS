#include <ExplorationCriterion.hpp>

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
        int *alumnosSep)
    {
    int aluchange,colchange;
    shuffle(shuffle_student,1,dist);
    shuffle(shuffle_colegios,1,dist2);
    aluchange=shuffle_student[0];
    colchange = shuffle_colegios[0];

    //ELimina el estudiante de la escuela actual
    aluxcol[currentSolution[aluchange]]-=1;
    aluVulxCol[currentSolution[aluchange]]-=alumnosSep[aluchange];
    //Asigna al estudiante a la nueva escuela
    currentSolution[aluchange] = colchange;
    aluxcol[colchange]+=1;
    aluVulxCol[colchange]+=alumnosSep[aluchange];


        // Obtiene el costo Actual

    return newSolution_v2(n_students,n_colegios,totalVuln,aluxcol,aluVulxCol,cupoArray,distMat,currentSolution,ptr_alpha);
}

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
        int *alumnosSep)
    {
    int aluchange,colchange;
    double *mSolution[n_block];
    for (int x=0; x<n_block; x++){
        mSolution[x] = (double*)malloc(n_thread * sizeof(double));
    }

    shuffle(shuffle_student,n_block,dist);
    shuffle(shuffle_colegios,n_thread,dist2);

    int *c_aluxcol=(int *)malloc(sizeof(int)*n_colegios);
    int *c_aluVulxCol=(int *)malloc(sizeof(int)*n_colegios);
    int *c_currentSolution =(int *)malloc(sizeof(int)*n_students);

    double minSolution = 0;


    for(int i =0; i < n_block; i++)
    {
        for(int j=0; j < n_thread; j++)
        {
            aluchange = shuffle_student[i];
            colchange = shuffle_colegios[j];


            
            memcpy(c_aluxcol,aluxcol,sizeof(int)*n_colegios);
            memcpy(c_aluVulxCol,aluVulxCol,sizeof(int)*n_colegios);
            memcpy(c_currentSolution,currentSolution,sizeof(int)*n_students);
        
            //ELimina el estudiante de la escuela actual
            c_aluxcol[c_currentSolution[aluchange]]-=1; ///
            c_aluVulxCol[c_currentSolution[aluchange]]-=alumnosSep[aluchange]; ///
            c_aluxcol[colchange]+=1; ///
            c_aluVulxCol[colchange]+=alumnosSep[aluchange]; ///
            c_currentSolution[aluchange] = colchange; ///

            if(c_currentSolution[aluchange] != currentSolution[aluchange]){ 
                mSolution[i][j] = newSolution_v2(n_students,n_colegios,totalVuln,c_aluxcol,c_aluVulxCol,cupoArray,distMat,c_currentSolution,ptr_alpha);
            }
            else{
                /*
                Cuando aleatoriamente el estudiante seleccionado se trata de mover a la misma escuela que ya pertenece
                se deja que el valor es 1 para que no se considere como el minimo entre los posibles movimientos
                */
                mSolution[i][j] = 1;
            }
            
        }
        
        
    }
    minSolution= mSolution[0][0];
    aluchange=shuffle_student[0];
    colchange = shuffle_colegios[0];

    for(int i =0; i < n_block; i++)
    {
        for(int j=0; j < n_thread; j++)
        {
        
            if(mSolution[i][j] <= minSolution && i != 0 && j !=0 ){
                minSolution = mSolution[i][j];
                aluchange=shuffle_student[i];
                colchange = shuffle_colegios[j];
            }
        }
    }


    //ELimina el estudiante de la escuela actual

    aluxcol[currentSolution[aluchange]]-=1; ///
    aluVulxCol[currentSolution[aluchange]]-=alumnosSep[aluchange]; ///
    aluxcol[colchange]+=1; ///
    aluVulxCol[colchange]+=alumnosSep[aluchange]; ///
    currentSolution[aluchange] = colchange; ///


    // For que busca al menor
    for(int i =0; i < n_block; i++)
    {
        free(mSolution[i]);
    }
    free(c_aluxcol);
    free(c_aluVulxCol);
    free(c_currentSolution);

    
    return minSolution;

        // Obtiene el costo Actual

    
}