# m_matschiner Fri Jul 21 14:04:17 CEST 2017

# Make the plot directory if it doesn't exist yet.
mkdir -p ../res/plots

# Define variables.
diretmid_dnds_table_file_name="../res/tables/dnds_diretmidae.txt"
nondiretmid_dnds_table_file_name="../res/tables/dnds_nondiretmidae.txt"
plot_file_name="../res/plots/dnds.pdf"
res_file_name="../res/plots/dnds.txt"

# Use an r script to generate a plot of the two distributions.
rscript plot_dnds_distributions.r ${diretmid_dnds_table_file_name} ${nondiretmid_dnds_table_file_name} ${plot_file_name} > ${res_file_name}