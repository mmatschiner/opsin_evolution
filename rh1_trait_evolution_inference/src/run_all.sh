# m_matschiner Fri Jul 14 18:03:07 CEST 2017

# Prune tips from the tree for which no rod opsin wavelength data is available.
bash prune_trees.sh

# Make a disparity-through-time plot with geiger.
bash run_dtt_on_tree.sh

# Make a phenogram of wavelength evolution with phytools.
bash produce_phenogram.sh

# Run a basic model comparison with geiger.
bash run_model_comparison.sh

# Infer ancestral states of wavelengths with rphylopars.
bash run_ancestral_inference.sh
