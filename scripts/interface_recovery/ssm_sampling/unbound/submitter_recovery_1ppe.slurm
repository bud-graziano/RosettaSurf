#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 48:00:00
#SBATCH --partition serial
#SBATCH --output=./1ppe.%A_%a.out
#SBATCH --error=./1ppe.%A_%a.err

mut_res=("223X" "224X" "226X" "227X" "228X" "229X" "230X" "231X" "239X" "240X" "241X" "245X" "246X" "247X" "249X" "251X")

for i in {0..15}
do
    srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol recovery_1ppe.xml -ignore_unrecognized_res -out:file:score_only recover_1ppe.sc -s ../../../../data/interface_recovery/pdb_structures/unbound/1ppe_0001.pdb -parser:script_vars r=${mut_res[$i]} -out:no_nstruct_label -mute all -in:file:native ../../../../data/interface_recovery/pdb_structures/unbound/1ppe_0001.pdb -out:suffix _${mut_res[$i]}
done
