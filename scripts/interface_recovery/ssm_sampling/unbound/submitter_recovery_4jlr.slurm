#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 48:00:00
#SBATCH --partition serial
#SBATCH --output=./4jlr.%A_%a.out
#SBATCH --error=./4jlr.%A_%a.err

mut_res=("269X" "272X" "273X" "275X" "276X" "282X" "283X" "285X" "286X" "287X" "289X" "290X" "293X")

for i in {0..12}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol recovery_4jlr.xml -ignore_unrecognized_res -out:file:score_only recover_4jlr.sc -s ../../../../data/interface_recovery/pdb_structures/unbound/4jlr_0001.pdb -parser:script_vars r=${mut_res[$i]} -out:no_nstruct_label -in:file:native ../../../../data/interface_recovery/pdb_structures/unbound/4jlr_0001.pdb -mute all -out:suffix _${mut_res[$i]}
done
