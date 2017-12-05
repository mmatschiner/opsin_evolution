# m_matschiner Thu Jun 22 16:53:46 CEST 2017

# Make the output directory if it doesn't exist yet.
mkdir -p ../res/plots

# Use the ape package in R to reconstruct ancestral states in the phylogeny.
rscript reconstruct_ancestral_depths.r