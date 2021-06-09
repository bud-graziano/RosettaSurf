#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 48:00:00
#SBATCH --partition serial
#SBATCH --output=./5jds.%A_%a.out
#SBATCH --error=./5jds.%A_%a.err

mut_res=("116X" "142X" "144X" "145X" "147X" "214X" "215X" "216X" "217X" "219X" "220X" "223X" "224X" "226X" "228X" "229X" "231X")

for i in {0..16}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol recovery_5jds.xml -ignore_unrecognized_res -out:file:score_only recover_5jds.sc -s ../../../../data/interface_recovery/pdb_structures/bound/5jds_0001.pdb -parser:script_vars r=${mut_res[$i]} -out:no_nstruct_label -mute all -in:file:native ../../../../data/interface_recovery/pdb_structures/bound/5jds_0001.pdb -out:suffix _${mut_res[$i]}
done
