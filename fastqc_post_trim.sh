ml FastQC

mkdir -p fastqc_trimmed_results

paired_files=(
  "output_forward_paired_trimmomatic.fq.gz"
  "output_reverse_paired.fq.gz"
)

for file in "${paired_files[@]}"; do
  fastqc "$file" -o fastqc_trimmed_results
done
