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
    int nb = 1;
    int nt = 1;
    double *mSolution[nb];
    for (int x=0; x<nb; x++)
        mSolution[x] = (double*)malloc(nt * sizeof(double));


    shuffle(shuffle_student,nb,dist);
    shuffle(shuffle_colegios,nt,dist2);

    int *c_aluxcol=(int *)malloc(sizeof(int)*n_colegios);
    int *c_aluVulxCol=(int *)malloc(sizeof(int)*n_colegios);
    int *c_currentSolution =(int *)malloc(sizeof(int)*n_students);
    int *c_alumnosSep= (int *)malloc( sizeof(int)*n_students);

    double minSolution = 0;


    for(int i =0; i < nb; i++)
    {
        for(int j=0; j < nt; j++)
        {
            memcpy(c_aluxcol,aluxcol,sizeof(int)*n_colegios);
            memcpy(c_aluVulxCol,aluVulxCol,sizeof(int)*n_colegios);
            memcpy(c_currentSolution,currentSolution,sizeof(int)*n_students);
            memcpy(c_alumnosSep,alumnosSep,sizeof(int)*n_students);

            aluchange=shuffle_student[i];
            colchange = shuffle_colegios[j];
            //ELimina el estudiante de la escuela actual
            c_aluxcol[c_currentSolution[aluchange]]-=1;
            c_aluVulxCol[c_currentSolution[aluchange]]-=c_alumnosSep[aluchange];
            //Asigna al estudiante a la nueva escuela
            c_currentSolution[aluchange] = colchange;
            c_aluxcol[colchange]+=1;
            c_aluVulxCol[colchange]+=c_alumnosSep[aluchange];
            mSolution[i][j] = newSolution_v2(n_students,n_colegios,totalVuln,c_aluxcol,c_aluVulxCol,cupoArray,distMat,c_currentSolution,ptr_alpha);
        }
        
    }
    minSolution= mSolution[0][0];
    for(int i =0; i < nb; i++)
    {
        for(int j=0; j < nt; j++)
        {
        
            if(mSolution[i][j] < minSolution){
                minSolution = mSolution[i][j];
                aluchange=shuffle_student[i];
                colchange = shuffle_colegios[j];
            }
        }
    }


    //ELimina el estudiante de la escuela actual
    aluxcol[currentSolution[aluchange]]-=1;
    aluVulxCol[currentSolution[aluchange]]-=alumnosSep[aluchange];
    //Asigna al estudiante a la nueva escuela
    currentSolution[aluchange] = colchange;
    aluxcol[colchange]+=1;
    aluVulxCol[colchange]+=alumnosSep[aluchange];


    // For que busca al menor
    for(int i =0; i < nb; i++)
    {
        free(mSolution[i]);
    }
    free(c_aluxcol);
    free(c_aluVulxCol);
    free(c_currentSolution);
    free(c_alumnosSep);

    
    return minSolution;

        // Obtiene el costo Actual

    
}