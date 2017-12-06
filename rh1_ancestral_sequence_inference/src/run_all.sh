# m_matschiner Fri Jul 14 16:03:11 CEST 2017

# Prepare replicate directories for BEAST analyses.
bash prepare_beast_analyses.sh

# Run BEAST analyses.
bash run_beast_analyses.sh

# Combine results of BEAST analyses.
bash combine_beast_results.sh

# Convert and clean estimated ancestral sequences for dn/ds calculations.
bash prepare_dnds_calculation.sh

# Calculate dn/ds per branch with codeml.
bash calculate_dnds_per_branch.sh

# Make two distributions from the dnds table (within and outside of Diretmidae).
bash get_dnds_distributions.sh

# Plot the two distributions.
bash plot_dnds_distributions.sh

# Calculate dN/dS for each gene by comparing the sequence of this gene with the posterior set of reconstructed sequences for the root.
bash calculate_dnds_per_gene.sh

# Extract statistics for the dN/dS distributions found in the previous step.
bash get_dnds_per_gene_stats.sh

# Identify mutations of the key tunings sites.
bash get_key_tuning_site_mutations.sh
