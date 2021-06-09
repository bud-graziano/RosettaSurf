# Protein interface sequence recovery

* **bound**: Contains scripts to replciate the `RosettaSurf` and `FixBB` interface recovery benchmark in the presence of the binder.
* **unbound**: Contains scripts to replicate the `RosettaSurf` and `FixBB` interface recovery benchmark in the absence of the binder.
* **ssm sampling**: Contains scripts for the interface recovery benchmark with `RosettaSurf-site` to sample individual amino acids. The directory contains scripts for both, bound and unbound, benchmark cases.
* **ssm** Contains script to replicate the `RosettaSurf-site` interface recovery benchmark with the sample input from the preivous step.


Included files are `xml` scripts that are executed with the RosettaScript framework along with `resfile`, and `submitter.sh` SLURM files that can be used to submit the computational scripts to a HPC cluster.