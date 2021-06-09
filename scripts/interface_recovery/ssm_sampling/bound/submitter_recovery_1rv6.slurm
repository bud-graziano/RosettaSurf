#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 48:00:00
#SBATCH --partition serial
#SBATCH --output=./1rv6.%A_%a.out
#SBATCH --error=./1rv6.%A_%a.err

mut_res=("198X" "199X" "200X" "202X" "204X" "228X" "229X" "230X" "231X" "256X" "259X" "260X" "261X" "276X" "278X" "280X" "281X")

for i in {0..16}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol recovery_1rv6.xml -ignore_unrecognized_res -out:file:score_only recover_1rv6.sc -s ../../../../data/interface_recovery/pdb_structures/bound/1rv6_0001.pdb -parser:script_vars r=${mut_res[$i]} -out:no_nstruct_label -mute all -in:file:native ../../../../data/interface_recovery/pdb_structures/bound/1rv6_0001.pdb -out:suffix _${mut_res[$i]}
done
