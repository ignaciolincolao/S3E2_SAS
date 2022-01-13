coolingrates=(0.98 0.998)
temp_inital=(100000.0 1000.0 10.0)
len2array=(85.0 280.0)
reheatinRates=(0.99)
e_constRates=(0.01 0.1)

echo "time,costBestSolution,meanDistN,meanDist,S,costCupo,count,temp_init,temp_final,min_temp,seed,alpha1,alpha2,alpha3,alpha1P,alpha2P,alpha3P,coolingRate,k_reheating_init,e_const,n_reheating,len1_init,len2_init,len3_init,len4_init,len1,len2,len3,len4,Th,n_block,n_thread,experiment,route" >> info_save_test2.txt
for repeat in {1..30}
do 
    for len2 in "${len2array[@]}"
    do
        for rate in "${coolingrates[@]}"
        do
            for temp_ini in "${temp_inital[@]}"
            do
                for reheating in "${reheatinRates[@]}"
                do
                    for e_const in "${e_constRates[@]}"
                    do
                        line=$(head -n 1 "./save_exp2/$len2/rate_$rate/$temp_ini/$reheating/$e_const/$repeat-info-test.txt")
                        line+=",./save_exp2/$len2/rate_$rate/$temp_ini/$reheating/$e_const/$repeat-info-test.txt"
                        echo "$line" >> info_save_test2.txt
                    done
                done
            done
        done
    done
done

