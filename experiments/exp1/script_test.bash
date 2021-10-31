coolingrates=(0.98 0.99 0.992 0.998 0.9998)

mkdir -p "./save_example_15_30_25"
cd ./build
let seed=125
for repeat in `seq $1 $2`
do
    for rate in "${coolingrates[@]}"
    do
        mkdir -p "../save_example_15_30_25/rate_$rate"
        echo "---------######## Estado 15 30 25 ####### En rate_$rate donde $repeat de 30 ######----------"
        ((seed+=$repeat*2))
        ./s3e2_sas 15 30 25 $rate 0.0 100000 0.00000009 1 1 "../save_example_15_30_25/rate_$rate/" "$repeat" $seed "exp1"
    done
done
echo "---------######## Completado 15 30 25 ####### Completado rate_$rate donde $repeat de 30 ######----------"