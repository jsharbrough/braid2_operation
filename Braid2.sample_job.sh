#!/bin/bash
#SBATCH --array 0-6 #ADJUST THIS TO THE NUMBER OF SAMPLES (EACH SAMPLE HAS A FORWARD READ FILE AND A REVERSE READ FILE)
#SBATCH --partition largemem #AVAILABLE OPTIONS ARE 'batch' or 'normal' (48 cores/node systems with varying amounts of RAM, from 192GB to 512GB), or 'largemem' are 1TB, or 3TB of RAM and either Intel or AMD processors
#SBATCH --time=24:00:00
#SBATCH --job-name=jobName
#SBATCH --mail-user=email@address #CHANGE EMAIL TO YOUR EMAIL
#SBATCH --mail-type=ALL
#SBATCH --ntasks 1 #KEEPS THE JOB ON A SINGLE NODE
#SBATCH --mem=12G #MEMORY REQUEST
#SBATCH --cpus-per-task=12 #NUMBER OF CPUS
#SBATCH --error=ERR_%A_%a.err
#SBATCH --output=OUT_%A_%a.out

#ACTIVATE THE MAMBA ENVIRONMENT
eval "$(mamba shell hook --shell bash)"
mamba activate readQC 

echo $SLURM_ARRAY_TASK_ID #THE $SLURM_ARRAY_TASK_ID VARIABLE IS THE SPECIFIC ARRAY JOB NUMBER, WITH WHICH YOU CAN CONTROL JOB INFORMATION


#GET READ FILE NAMES
readFOFN=novaSeq_reads.fofn #CHANGE THIS TO MATCH YOUR FILE OF FILE NAMES FOR THE SET OF READS YOU ARE WORKING WITH

i="$(($SLURM_ARRAY_TASK_ID*2))"
r1=$(python getLine.py $readFOFN $i)
r2=$(python getLine.py $readFOFN "$(($i+1))")
r1_len="$((${#r1}-9))"
r1_base=${r1:0:$r1_len}
r2_len="$((${#r2}-9))"
r2_base=${r2:0:$r2_len}

#RUN CODE
