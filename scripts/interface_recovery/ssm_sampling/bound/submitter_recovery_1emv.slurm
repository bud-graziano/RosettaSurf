#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 48:00:00
#SBATCH --partition serial
#SBATCH --output=./1emv.%A_%a.out
#SBATCH --error=./1emv.%A_%a.err

mut_res=("134X" "137X" "138X" "154X" "155X" "156X" "157X" "158X" "160X" "161X" "164X" "166X" "167X" "169X" "170X" "171X" "172X" "175X" "180X" "181X")

for i in {0..19}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol recovery_1emv.xml -ignore_unrecognized_res -out:file:score_only recover_1emv.sc -s ../../../../data/interface_recovery/pdb_structures/bound/1emv_0001.pdb -parser:script_vars r=${mut_res[$i]} -out:no_nstruct_label -mute all -in:file:native ../../../../data/interface_recovery/pdb_structures/bound/1emv_0001.pdb -out:suffix _${mut_res[$i]}
done
