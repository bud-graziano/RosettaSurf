#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks-per-node 1
#SBATCH --cpus-per-task 1
#SBATCH --mem 8192
#SBATCH --time 24:00:00
#SBATCH --partition serial
#SBATCH --job-name=bize
#SBATCH --array=1-500
#SBATCH --output=./d25_3ezib.%A_%a.out
#SBATCH --error=./d25_3ezib.%A_%a.err

srun /PATH_TO_ROSETTA/source/bin/rosetta_scripts.default.linuxiccrelease -parser:protocol fixbb_design.xml -ignore_unrecognized_res -s 3ezib_design_complex.pdb -mute core.scoring.sc -nstruct 2 -out:suffix _${SLURM_ARRAY_JOB_ID}_${SLURM_ARRAY_TASK_ID} -out:file:silent d25_rosetta_fixbb.silent_${SLURM_ARRAY_JOB_ID}_${SLURM_ARRAY_TASK_ID} -use_input_sc -out:file:silent_struct_type binary -jd2:delete_old_poses 
