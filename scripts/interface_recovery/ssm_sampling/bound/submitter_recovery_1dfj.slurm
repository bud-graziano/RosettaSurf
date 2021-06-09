#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 48:00:00
#SBATCH --partition serial
#SBATCH --output=./1dfj.%A_%a.out
#SBATCH --error=./1dfj.%A_%a.err

mut_res=("4X" "7X" "11X" "12X" "23X" "24X" "27X" "28X" "31X" "32X" "37X" "38X" "39X" "41X" "42X" "43X" "44X" "66X" "67X" "68X" "69X" "71X" "86X" "87X" "88X" "89X" "91X" "109X" "111X" "118X" "119X")

for i in {0..30}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol 1dfj.xml -ignore_unrecognized_res -out:file:score_only recover_1dfj.sc -s ../../../../data/interface_recovery/pdb_structures/bound/1dfj_0001.pdb -parser:script_vars r=${mut_res[$i]} -out:no_nstruct_label -mute all -in:file:native ../../../../data/interface_recovery/pdb_structures/bound/1dfj_0001.pdb -out:suffix _${mut_res[$i]}
done
