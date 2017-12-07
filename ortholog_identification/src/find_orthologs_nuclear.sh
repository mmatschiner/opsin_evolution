# Michael Matschiner, 2015-07-22

# Get command line arguments.
query_dir=$1
subjects_list_file_name=$2
alignment_dir=$3

# Make the alignment directory if it doesn't exist yet.
mkdir -p ${alignment_dir}

# Start slurm jobs for each fasta file in the query directory.
for i in ${query_dir}/*.fasta
do
	## If running this on a server with SLURM, uncomment the next line.
    # sbatch find_orthologs_nuclear.slurm ${i} ${subjects_list_file_name} ${alignment_dir}
    ## If running this on a server with SLURM, comment the next two lines.
    python3 find_orthologs.py -t --refine -s 1 ${i} ${subjects_list_file_name}
    mv *.fasta ${alignment_dir}
done
