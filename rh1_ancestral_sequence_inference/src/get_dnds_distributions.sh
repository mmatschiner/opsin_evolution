# m_matschiner Fri Jul 21 13:31:12 CEST 2017

# Define variables.
dnds_table_file_name="../res/tables/dnds.txt"
tree_file_name="../data/trees/rod_opsin_notranslate.tre"
diretmidae_branch_id="b95"
diretmid_dnds_table_file_name="../res/tables/dnds_diretmidae.txt"
nondiretmid_dnds_table_file_name="../res/tables/dnds_nondiretmidae.txt"

# Use a ruby script to extract dnds distributions.
ruby get_dnds_distributions.rb ${dnds_table_file_name} ${tree_file_name} ${diretmidae_branch_id} ${diretmid_dnds_table_file_name} ${nondiretmid_dnds_table_file_name}