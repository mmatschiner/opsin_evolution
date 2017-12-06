# m_matschiner Mon Jul 17 14:43:56 CEST 2017

# Make the log directory if it doesn't exist yet.
mkdir -p ../log

# Define variables.
treeOrigin_seqs_file_name="../res/alignments/treeOrigin.phy"
extant_seqs_file_name="../data/alignments/RH1_ourdata_20161023_trimmed.phy"
codeml_path="codeml"
dnds_file_name="../res/tables/dnds_per_gene.txt"

# Use a ruby script to run codeml for estimation of dn/ds, for each branch.
ruby calculate_dnds_per_gene.rb ${treeOrigin_seqs_file_name} ${extant_seqs_file_name} ${codeml_path} ${dnds_file_name} > "../log/calculate_dnds_per_gene.out"
