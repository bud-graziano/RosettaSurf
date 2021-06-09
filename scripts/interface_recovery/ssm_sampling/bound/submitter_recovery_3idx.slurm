#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 48:00:00
#SBATCH --partition serial
#SBATCH --output=./3idx.%A_%a.out
#SBATCH --error=./3idx.%A_%a.err

mut_res=("424X" "425X" "426X" "427X" "428X" "429X" "430X" "431X" "442X" "466X" "468X" "473X" "520X")

for i in {0..12}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol recovery_3idx.xml -ignore_unrecognized_res -out:file:score_only recover_3idx.sc -s ../../../../data/interface_recovery/pdb_structures/bound/3idx_0001.pdb -parser:script_vars r=${mut_res[$i]} -out:no_nstruct_label -in:file:native ../../../../data/interface_recovery/pdb_structures/bound/3idx_0001.pdb -mute all -out:suffix _${mut_res[$i]}
done
