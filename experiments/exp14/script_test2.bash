coolingrates=(0.98 0.998)
temp_inital=(100000.0 1000.0 10.0)
len2array=(85.0 280.0)
reheatinRates=(0.99)
e_constRates=(0.01 0.1)
# save_exp 23853
# save_exp2 29853*84 = 2537505
mkdir -p "./save_exp2"
cd ./build
let seed=125
for repeat in `seq $1 $2`
do 
    for len2 in "${len2array[@]}"
    do
        mkdir -p "../save_exp2/$len2"
        for rate in "${coolingrates[@]}"
        do
            mkdir -p "../save_exp2/$len2/rate_$rate"
            for temp_ini in "${temp_inital[@]}"
            do
                mkdir -p "../save_exp2/$len2/rate_$rate/$temp_ini"
                for reheating in "${reheatinRates[@]}"
                do
                    mkdir -p "../save_exp2/$len2/rate_$rate/$temp_ini/$reheating"
                    for e_const in "${e_constRates[@]}"
                    do
                        mkdir -p "../save_exp2/$len2/rate_$rate/$temp_ini/$reheating/$e_const"
                        echo "----- len2: $len2 rate: $rate temp_ini: $temp_ini rep: $repeat de 30 ----"
                        ((seed+=$repeat*2))
                        # Orden de los parametros
                        # ejecutable | temp_ini | min_temp | seed | alpha1 | alpha2 | alpha3 | coolingRate | k_reheating | e_const | n_reheating | len1 | len2 | len3 | len4 | Th | n_block | n_thread | rutaSave | prefijo | name_exp
                        ./s3e2_sas $temp_ini 0.00000009 $seed 15 30 25 $rate $reheating $e_const 2537505 1 $len2 -1 -1 -1 -1 -1 "../save_exp2/$len2/rate_$rate/$temp_ini/$reheating/$e_const/" "$repeat" "exp14"
                    done
                done
            done
        done
    done
done
echo "fin de ----- len2: $len2 rate: $rate temp_ini: $temp_ini rep: $repeat de 30 ----"

