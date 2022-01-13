coolingrates=(0.98)
temp_inital=(100000.0 1000.0 10.0)
len4array=(0.99)
Ths=(1.01 1.001)
mkdir -p "./save_exp"
cd ./build
let seed=1245
for repeat in `seq $1 $2`
do 
    for len4 in "${len4array[@]}"
    do
        mkdir -p "../save_exp/$len4"
        for rate in "${coolingrates[@]}"
        do
            mkdir -p "../save_exp/$len4/rate_$rate"
            for temp_ini in "${temp_inital[@]}"
            do
                for Th in "${Ths[@]}"
                do
                    mkdir -p "../save_exp/$len4/rate_$rate/$temp_ini/$Th"
                    echo "----- len4: $len4 rate: $rate temp_ini: $temp_ini rep: $repeat de 30 ----"
                    ((seed+=$repeat*2))
                    # Orden de los parametros
                    # ejecutable | temp_ini | min_temp | seed | alpha1 | alpha2 | alpha3 | coolingRate | k_reheating | e_const | n_reheating | len1 | len2 | len3 | len4 | Th | n_block | n_thread | rutaSave | prefijo | name_exp
                    ./s3e2_sas $temp_ini 0.00000009 $seed 15 30 25 $rate -1 -1 -1 -1 -1 1 $len4 $Th -1 -1 "../save_exp/$len4/rate_$rate/$temp_ini/$Th/" "$repeat" "exp8"
                done
            done
        done
    done
done
echo "fin de ----- len2: $len4 rate: $rate temp_ini: $temp_ini rep: $repeat de 30 ----"
