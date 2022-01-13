coolingrates=(0.98)
temp_inital=(100000.0 1000.0 10.0)
len4array=(0.99 0.988)


echo "time,costBestSolution,meanDistN,meanDist,S,costCupo,count,temp_init,temp_final,min_temp,seed,alpha1,alpha2,alpha3,alpha1P,alpha2P,alpha3P,coolingRate,k_reheating_init,e_const,n_reheating,len1_init,len2_init,len3_init,len4_init,len1,len2,len3,len4,Th,n_block,n_thread,experiment,route" >> info_save_test.txt
for repeat in {1..30}
do 
    for len4 in "${len4array[@]}"
    do
        mkdir -p "../save_exp/$len4"
        for rate in "${coolingrates[@]}"
        do
            mkdir -p "../save_exp/$len4/rate_$rate"
            for temp_ini in "${temp_inital[@]}"
            do
                    line=$(head -n 1 "./save_exp/$len4/rate_$rate/$temp_ini/$repeat-info-test.txt")
                    line+=",./save_exp/$len4/rate_$rate/$temp_ini/$repeat-info-test.txt"
                    echo "$line" >> info_save_test.txt
            done
        done
    done
done

