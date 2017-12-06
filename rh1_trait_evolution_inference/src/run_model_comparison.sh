# m_matschiner Wed Jul  5 14:23:53 CEST 2017

# Make the results directory if it does not exist yet.
mkdir -p ../res/geiger

# Compare different models of trait evolution.
rscript run_model_comparison.r ../res/trees/rod_opsin_pruned.tre ../data/tables/wavelengths.txt > ../res/geiger/model_comparison.txt