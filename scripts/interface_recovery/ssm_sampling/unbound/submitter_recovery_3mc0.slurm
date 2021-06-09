#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 48:00:00
#SBATCH --partition serial
#SBATCH --output=./3mc0.%A_%a.out
#SBATCH --error=./3mc0.%A_%a.err

mut_res=("46X" "49X" "50X" "51X" "52X" "53X" "54X" "55X" "56X" "64X" "70X")

for i in {0..10}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol recovery_3mc0.xml -ignore_unrecognized_res -out:file:score_only recover_3mc0.sc -s ../../../../data/interface_recovery/pdb_structures/unbound/3mc0_0001.pdb -parser:script_vars r=${mut_res[$i]} -out:no_nstruct_label -in:file:native ../../../../data/interface_recovery/pdb_structures/unbound/3mc0_0001.pdb -mute all -out:suffix _${mut_res[$i]}
done
