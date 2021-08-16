#!/bin/bash
#================================================================
# HEADER
#================================================================
#% USAGE
#+    bash sars2_assembly_singularity_run.sh reference.fasta code_R1.fastq.gz code_R2.fastq.gz prefix_name 8 5 75 adapters.fa iam_sarscov:0.0.4
#%
#% DESCRIPTION
#%      This script run the sars2_assembly_singularity inside the singularity enviroment
#%
#================================================================
# END_OF_HEADER
#================================================================

#================================================================
# ARGUMENTS
#================================================================

#================================================================
# ARGUMENTS
#================================================================
INPUT_DIR=$1 # input dir path
# WARNING: All remaining arguments must be define in relation to INPUT_DIR
# The container assumes all input files are inside the specified dir.
# ex: if /my/input/dir/fastq_R1.fastq.gz, then FASTQ1 should be fastq_R1.fastq.gz
#     if /my/input/dir/reference/ref.fasta, then FASTA must be referece/ref.fasta
FASTA=$2 #reference genome file path **inside dir path**
FASTQ1=$3 #foward reads file name
FASTQ2=$4 #reverse reads
PREFIXOUT=$5 #prefix for output
THREADS=$6 #number of threads
DEPTH=$7 #minum depth to mask regions
MIN_LEN=$8 #minimum length to trimm reads
ADAPTERS=$9 #fasta file with adapters
IMAGE=${10} # container image filepath

singularity run --bind $INPUT_DIR:/data/ --env REFERENCE=$FASTA --env FASTQ1=$FASTQ1 --env FASTQ2=$FASTQ2 --env PREFIXOUT=$PREFIXOUT --env THREADS=$THREADS --env DEPTH=$DEPTH --env MIN_LEN=$MIN_LEN --env ADAPTERS=$ADAPTERS --writable-tmpfs $IMAGE
