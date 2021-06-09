#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 48:00:00
#SBATCH --partition serial
#SBATCH --output=./6b9j.%A_%a.out
#SBATCH --error=./6b9j.%A_%a.err

mut_res=("250X" "251X" "253X" "255X" "260X" "262X" "358X" "359X" "360X" "361X" "362X" "363X" "365X" "419X")

for i in {0..13}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol recovery_6b9j.xml -ignore_unrecognized_res -out:file:score_only recover_6b9j.sc -s ../../../../data/interface_recovery/pdb_structures/bound/6b9j_0001.pdb -parser:script_vars r=${mut_res[$i]} -out:no_nstruct_label -in:file:native ../../../../data/interface_recovery/pdb_structures/bound/6b9j_0001.pdb -mute all -out:suffix _${mut_res[$i]}
done
