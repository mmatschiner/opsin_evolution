#!/bin/bash
#SBATCH --job-name=f_ortho
#SBATCH --time=168:00:00
#SBATCH --mem-per-cpu=2G
#SBATCH --cpus-per-task=1

# Start with e.g.
# sbatch find_orthologs_nuclear.slurm ../data/queries/nuclear/exons.fasta ../data/subjects/nuclear.txt ../analysis/alignments/nuclear/01/

# Abel setup.
module load python3/3.4.0
module load blast+/2.2.29
module load mafft/7.157

# Get command line arguments.
queries_file_name_w_path=$1
queries_file_name=`basename ${queries_file_name_w_path}`
subject_file_name_w_path=$2
subjects_file_name=`basename ${subject_file_name_w_path}`
alignment_dir_out=`readlink -f ${3}`

# Copy script to TMPDIR.
echo -n "Copying file find_orthologs.py..."
cp find_orthologs.py $TMPDIR
echo " done."

# Make the alignment output directory if it doesn't exist yet.
mkdir -p $alignment_dir_out

# Copy input to TMPDIR.
echo -n "Copying input files..."
cp ${queries_file_name_w_path} $TMPDIR
cp ${subject_file_name_w_path} $TMPDIR
cp ${alignment_dir_out}/*.fasta $TMPDIR
echo " done."

cd $TMPDIR

# Run find_orthologs.py for each marker, with each of the subjects.
echo -n "Running find_orthologs.py with query file ${queries_file_name} and subject file ${subjects_file_name}..."
python3 find_orthologs.py -t --refine -s 1 ${queries_file_name} ${subjects_file_name}
echo " done."

# Copy fasta files to alignment directory.
echo -n "Copying alignment files back to the submission directory..."
rm ${query_file_name}
cp *.fasta ${alignment_dir_out}
echo " done."
