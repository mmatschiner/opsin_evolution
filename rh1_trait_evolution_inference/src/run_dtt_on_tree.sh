# m_matschiner Wed Jul  5 13:11:03 CEST 2017

# Make the output directory if it doesn't exist yet.
mkdir -p ../res/geiger

# Run a disparity-through-time analysis with geiger.
rscript run_dtt_on_tree.r ../res/trees/rod_opsin_pruned.tre ../data/tables/wavelengths.txt > ../res/geiger/dtt.txt

# Move the output plot to the results directory.
mv Rplots.pdf ../res/geiger/dtt.pdf