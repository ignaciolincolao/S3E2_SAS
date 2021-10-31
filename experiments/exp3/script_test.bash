blockes=(32 64 128 256)
threads=(1 32 64 84)
coolingrates=(0.98 0.99 0.992)

mkdir -p "./save_example_15_30_25"
cd ./build
let seed=125
for repeat in `seq $1 $2`
do
    for block in "${blockes[@]}"
    do
        mkdir -p "../save_example_15_30_25/block_$block"
        for thread in "${threads[@]}"
        do
            mkdir -p "../save_example_15_30_25/block_$block/save_$thread"
            for rate in "${coolingrates[@]}"
            do
                mkdir -p "../save_example_15_30_25/block_$block/save_$thread/rate_$rate"
                echo "---------######## Estado 15 30 25 ####### bloque $block thread $thread ### En rate_$rate donde $repeat de 30 ######----------"
                ((seed+=$repeat+$block*$thread))
                ./s3e2_sas 15 30 25 $rate 0.0 100000 0.00000009 $block $thread "../save_example_15_30_25/block_$block/save_$thread/rate_$rate/" "$repeat" $seed
            done
        done
    done
done
