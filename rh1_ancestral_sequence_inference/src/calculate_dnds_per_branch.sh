# m_matschiner Mon Jul 17 14:43:56 CEST 2017

# Make the log directory if it doesn't exist yet.
mkdir -p ../log

# Define variables.
tree_file_name="../data/trees/rod_opsin_notranslate.tre"
reconstructed_seqs_dir="../res/alignments"
extant_seqs_file_name="../data/alignments/RH1_ourdata_20161023_trimmed.phy"
codeml_path="codeml"
substitutions_file_name="../res/tables/substitutions.txt"
dnds_file_name="../res/tables/dnds.txt"

# Use a ruby script to run codeml for estimation of dn/ds, for each branch.
ruby calculate_dnds_per_branch.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${codeml_path} 0 "../res/tables/substitutions_0.txt" "../res/tables/dnds_0.txt" > "../log/calculate_dnds_per_branch_0.out"
ruby calculate_dnds_per_branch.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${codeml_path} 1 "../res/tables/substitutions_1.txt" "../res/tables/dnds_1.txt" > "../log/calculate_dnds_per_branch_1.out"
ruby calculate_dnds_per_branch.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${codeml_path} 2 "../res/tables/substitutions_2.txt" "../res/tables/dnds_2.txt" > "../log/calculate_dnds_per_branch_2.out"
ruby calculate_dnds_per_branch.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${codeml_path} 3 "../res/tables/substitutions_3.txt" "../res/tables/dnds_3.txt" > "../log/calculate_dnds_per_branch_3.out"
ruby calculate_dnds_per_branch.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${codeml_path} 4 "../res/tables/substitutions_4.txt" "../res/tables/dnds_4.txt" > "../log/calculate_dnds_per_branch_4.out"
ruby calculate_dnds_per_branch.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${codeml_path} 5 "../res/tables/substitutions_5.txt" "../res/tables/dnds_5.txt" > "../log/calculate_dnds_per_branch_5.out"
ruby calculate_dnds_per_branch.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${codeml_path} 6 "../res/tables/substitutions_6.txt" "../res/tables/dnds_6.txt" > "../log/calculate_dnds_per_branch_6.out"
ruby calculate_dnds_per_branch.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${codeml_path} 7 "../res/tables/substitutions_7.txt" "../res/tables/dnds_7.txt" > "../log/calculate_dnds_per_branch_7.out"
ruby calculate_dnds_per_branch.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${codeml_path} 8 "../res/tables/substitutions_8.txt" "../res/tables/dnds_8.txt" > "../log/calculate_dnds_per_branch_8.out"
ruby calculate_dnds_per_branch.rb ${tree_file_name} ${reconstructed_seqs_dir} ${extant_seqs_file_name} ${codeml_path} 9 "../res/tables/substitutions_9.txt" "../res/tables/dnds_9.txt" > "../log/calculate_dnds_per_branch_9.out"

# Merge the substitutions and dnds files.
head -n 1 ../res/tables/substitutions_0.txt > ${substitutions_file_name}
for i in ../res/tables/substitutions_?.txt
do
	tail -n +2 $i
done >> ${substitutions_file_name}
head -n 1 ../res/tables/dnds_0.txt > ${dnds_file_name}
for i in ../res/tables/dnds_?.txt
do
	tail -n +2 $i
done >> ${dnds_file_name}
