# m_matschiner Mon Dec  4 15:07:51 CET 2017

# Define variables.
dnds_table_file_name="../res/tables/dnds_per_gene.txt"
dnds_stats_file_name="../res/tables/dnds_per_gene_stats.txt"

# Use a ruby script to calculate mean, median, and HPD interval per gene.
ruby get_dnds_per_gene_stats.rb ${dnds_table_file_name} > ${dnds_stats_file_name}