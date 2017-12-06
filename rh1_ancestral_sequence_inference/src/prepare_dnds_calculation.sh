# m_matschiner Mon Jul 17 11:59:41 CEST 2017

# Define variables.
tree_file_name="../data/trees/rod_opsin_notranslate.tre"
nucleotides_res_dir="../res/beast2/nucleotides/combined/reconstructions"
indels_res_dir="../res/beast2/indels/combined/reconstructions"
indels_def_file_name="../data/alignments/indels.nex"
alignment_file_name="../data/alignments/RH1_ourdata_20161023_trimmed.phy"
output_dir="../res/alignments"

# Make the output directory if it doesn't exist yet.
mkdir -p ${output_dir}

# Use a ruby script to convert and clean estimated ancestral sequences for dn/ds calculations.
ruby prepare_dnds_calculation.rb ${tree_file_name} ${nucleotides_res_dir} ${indels_res_dir} ${indels_def_file_name} ${alignment_file_name} ${output_dir}