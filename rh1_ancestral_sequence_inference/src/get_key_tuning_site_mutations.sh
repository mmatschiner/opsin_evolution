# m_matschiner Thu Jul 20 12:33:05 CEST 2017

# Define variables.
tree_file_name="../data/trees/rod_opsin_notranslate.tre"
reconstructed_seqs_dir="../res/alignments"
extant_seqs_file_name="../data/alignments/RH1_ourdata_20161023_trimmed.phy"
key_tuning_sites_file_name="../data/tables/key_tuning_sites.txt"
output_file="../res/tables/key_tuning_site_mutations.txt"
confidence_threshold="0.95"

# Use a ruby script to identify mutations of key tuning sites.
ruby get_key_tuning_site_mutations.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${key_tuning_sites_file_name} ${confidence_threshold} > ${output_file}

# Make a reduced version of the output file.
echo "    Branch   Key tuning site                                                      Gene   BPP(change since branch orgin)   BPP increase    AA at branch origin   AA at branch termination" > "../res/tables/key_tuning_site_mutations_uniq.txt"
cat ../res/tables/key_tuning_site_mutations.txt | grep "*" | sort | uniq >> ../res/tables/key_tuning_site_mutations_uniq.txt