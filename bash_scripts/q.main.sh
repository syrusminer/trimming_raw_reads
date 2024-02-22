#!/bin/sh
#SBATCH --account=utu
#SBATCH --partition=lonepeak
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH -o slurm-%j.out-%N
#SBATCH -e slurm-%j.err-%N

wd=~/Biol4310/Assignments/trimming_raw_reads
cd $wd
bash bash_scripts/trim_raw_reads.sh -l raw_reads_SRA_list.txt -d $wd
