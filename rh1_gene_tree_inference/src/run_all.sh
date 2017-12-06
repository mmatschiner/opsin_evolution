# m_matschiner Wed Dec 6 11:59:55 CET 2017

# Translate the list of constraints (../data/constraints/constraints.txt) into XML format.
bash make_constraints.sh

# Prepare XML input files for BEAST using the script beauti.rb.
bash prepare_beast_input.sh

# Prepare directories for replicate BEAST analyses.
bash prepare_beast_analyses.sh

# Run three replicate BEAST analyses (to run these analyses on a server using SLURM, use the start.slurm files written to each replicate directory).
bash run_beast_analyses.sh

# Combine the results of the replicate BEAST analyses.
bash combine_beast_results.sh

# Generate a MCC summary tree from the posterior tree distribution.
bash produce_beast_mcc_tree.sh