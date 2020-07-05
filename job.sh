#!/bin/bash
#PBS -l select=1:ncpus=48:mpiprocs=24
#PBS -l walltime=24:00:00
#PBS -j oe
#PBS -V
#PBS -N nome_do_job 
#PBS -m abe
#PBS -M meuemail@email.com

# load modules
#module load netcdf-intel/4.5.0

# change directory
cd ${PBS_O_WORKDIR}
# run
mpirun -np 24 siesta input.fdf > job.out
