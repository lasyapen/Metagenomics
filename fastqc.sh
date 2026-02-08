ml FastQC

mkdir -p fastqc_results

for file in *.fastq.gz; do
    fastqc "$file" -o fastqc_results
done

