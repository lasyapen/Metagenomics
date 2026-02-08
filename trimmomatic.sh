ml Trimmomatic 
java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -phred33 10_Atl_S32_R1_001.fastq.gz 10_Atl_S32_R2_001.fastq.gz output_forward_paired_trimmomatic.fq.gz output_forward_unpaired.fq.gz output_reverse_paired.fq.gz output_reverse_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36
