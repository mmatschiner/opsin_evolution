# m_matschiner Wed Jul 5 15:48:41 CEST 2017

# Make the output directory if it doesn't exist yet.
mkdir -p ../res/rphylopars

# Run model comparison and ancestral reconstruction with Rphylopars.
rscript run_ancestral_inference.r ../res/trees/rod_opsin_pruned.tre ../data/tables/wavelengths.txt ../res/rphylopars/node_labels.pdf > ../res/rphylopars/reconstructed_states.txt