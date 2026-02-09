#the script will need to be modified if using mamba instead of anaconda
ml Anaconda3

conda create -p test/env-phylo2
source activate test/env-phylo2

conda install -c bioconda phylophlan

phylophlan_write_default_configs.sh test
phylophlan -i /input -d phylophlan --diversity high -f supertree_aa.cfg --fast --maas phylophlan.tsv --force_nucleotides -o outputX/
