# m_matschiner Wed Jul  5 13:36:11 CEST 2017

# Make the output directory if it doesn't exist yet.
mkdir -p ../res/phytools

# Produce a phenogram for the evolution of wavelengths.
rscript produce_phenogram.r ../res/trees/rod_opsin_pruned.tre ../data/tables/wavelengths.txt ../res/phytools/phenogram.pdf