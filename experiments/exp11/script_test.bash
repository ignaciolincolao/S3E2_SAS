coolingrates=(0.98 0.989 0.998)
temp_inital=(100000.0 1000.0 10.0)
len2array=(2.0 85.0 280.0)

mkdir -p "./save_exp"
cd ./build
let seed=125
for repeat in `seq $1 $2`
do 
    for len2 in "${len2array[@]}"
    do
        mkdir -p "../save_exp/$len2"
        for rate in "${coolingrates[@]}"
        do
            mkdir -p "../save_exp/$len2/rate_$rate"
            for temp_ini in "${temp_inital[@]}"
            do
                mkdir -p "../save_exp/$len2/rate_$rate/$temp_ini"
                echo "----- len2: $len2 rate: $rate temp_ini: $temp_ini rep: $repeat de 30 ----"
                ((seed+=$repeat*2))
                # Orden de los parametros
                # ejecutable | temp_ini | min_temp | seed | alpha1 | alpha2 | alpha3 | coolingRate | k_reheating | e_const | n_reheating | len1 | len2 | len3 | len4 | Th | n_block | n_thread | rutaSave | prefijo | name_exp
                ./s3e2_sas $temp_ini 0.00000009 $seed 15 30 25 $rate -1 -1 -1 1 $len2 -1 -1 -1 -1 -1 "../save_exp/$len2/rate_$rate/$temp_ini/" "$repeat" "exp1"
            done
        done
    done
done
echo "fin de ----- len2: $len2 rate: $rate temp_ini: $temp_ini rep: $repeat de 30 ----"

