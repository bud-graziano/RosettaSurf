#!/bin/bash -l
#SBATCH --ntasks=288
#SBATCH --nodes=8
#SBATCH --ntasks-per-node 36
#SBATCH --ntasks-per-core=1
#SBATCH --cpus-per-task 1
#SBATCH --partition=normal
#SBATCH --constraint=mc
#SBATCH --time 24:00:00
#SBATCH --output=./%A_%a.out
#SBATCH --error=./%A_%a.err

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
module load daint-mc


NSTRUCT="-nstruct 572"
NAME="1dfj" # 1emv 1ppe 1rv6 3idx 3mc0 4jlr 5jds 6b9j
TYPE="surf_ssm"

srun -n $SLURM_NTASKS --ntasks-per-node=36 -c $SLURM_CPUS_PER_TASK /PATH_TO_ROSETTA/source/bin/rosetta_scripts.mpistatic.linuxiccrelease -s ../../../../data/interface_recovery/pdb_structures/unbound/${NAME}_0001.pdb -parser:protocol ${TYPE}_${NAME}.xml -out:suffix _${SLURM_TASK_PID} ${NSTRUCT} -out:file:silent unbound_${TYPE}_${NAME}.silent_${SLURM_TASK_PID} -out:file:scorefile unbound_${TYPE}_${NAME}.sc -in:file:native ../../../../data/interface_recovery/pdb_structures/unbound/${NAME}_0001.pdb -use_input_sc -out:file:silent_struct_type binary -jd2:delete_old_poses -in:path:database /PATH_TO_ROSETTA/database/ -mpi_tracer_to_file unbound_${TYPE}_${NAME}_${SLURM_TASK_PID}.log
