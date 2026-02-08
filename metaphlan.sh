gunzip -c output_forward_paired_trimmomatic.fq.gz > output_forward_paired_trimmomatic.fq
gunzip -c output_reverse_paired.fq.gz > output_reverse_paired.fq

ml Anaconda3 
conda create -p test/SampleX/env-meta2
source activate test/SampleX/env-meta2
conda install -c bioconda python=3.7 metaphlan
metaphlan output_forward_paired_trimmomatic.fq,output_reverse_paired.fq --bowtie2out metagenome.bowtie2.bz2 --nproc 5 --input_type fastq --unclassified_estimation -o profiled_metagenome.txt
