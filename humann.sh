#metaphlan was installed in a mamba environment called mpa4 previously and is called here when humann is run
ml Mamba

mamba create -p ~/envs/mpa5 -y python=3.10
source ~/envs/mpa5/bin/activate

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --add channels biobakery

~/envs/mpa5/bin/pip install humann --no-binary :all: --ignore-installed
conda install -c bioconda bowtie2 metaphlan -p ~/envs/mpa5

export PATH=~/.conda/envs/mpa4/bin:~/envs/mpa5/bin:$PATH
humann_config --update database_folders nucleotide humann_databases/chocophlan
humann_databases --download chocophlan full humann_databases --update-config no
humann_databases --download uniref uniref90_diamond humann_databases --update-config no

mkdir -p humann_output

for f in *_R1_cleaned.fastq.gz; do
    sample=$(basename "$f" _R1_cleaned.fastq.gz)
    humann --input "$f" --output "humann_output/${sample}" --threads 8 \
       --nucleotide-database humann_databases/chocophlan \
       --protein-database humann_databases/uniref \
       --metaphlan-options "--bowtie2db humann_databases/metaphlan"
done

