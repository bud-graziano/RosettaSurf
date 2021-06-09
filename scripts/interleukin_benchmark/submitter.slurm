#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 24:00:00
#SBATCH --partition serial
#SBATCH --output=./%A_%a.out
#SBATCH --error=./%A_%a.err

mut_res=("8A" "14A" "32A" "36A" "91A")

for i in {0..4}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol rosetta_surf_site.xml -ignore_unrecognized_res -use_input_sc -s 6dg5.pdb -parser:script_vars r=${mut_res[$i]} -out:no_nstruct_label -out:suffix _${mut_res[$i]} -out:file:scorefile il_pos_${mut_res[$i]}.sc
done
    
