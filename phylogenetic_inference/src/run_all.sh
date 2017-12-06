# m_matschiner Wed Dec  6 17:40:42 CET 2017

# Prepare BEAST input files for unconstrained (except the root) analyses for the concatenated nuclear dataset.
ruby prepare_concatenated_BEAST_analyses.rb ../data/nuclear ../res/nuclear_concatenated/beast2/unconstrained ../data/constraints/root_constraints.xml

# Run unconstrained (except the root) BEAST analyses for the concatenated nuclear dataset.
ruby run_BEAST_analyses.rb ../res/nuclear_concatenated/beast2/unconstrained

# Combine results of unconstrained (except the root) BEAST analyses for the concatenated nuclear dataset.
bash combine_BEAST_trees.sh ../res/nuclear_concatenated/beast2/unconstrained/replicates ../res/nuclear_concatenated/beast2/unconstrained/combined

# Prepare BEAST input files for fossil-constrained analyses for the concatenated nuclear dataset (separately for the two sets of 28 fossil constraints, with different assumptions for the earliest record of Tetraodontiformes).
ruby prepare_concatenated_BEAST_analyses.rb ../data/nuclear ../res/nuclear_concatenated/beast2/fossil_constrained_28a ../data/constraints/fossil_constraints_28a.xml ../res/nuclear_concatenated/beast2/unconstrained/combined
ruby prepare_concatenated_BEAST_analyses.rb ../data/nuclear ../res/nuclear_concatenated/beast2/fossil_constrained_28b ../data/constraints/fossil_constraints_28b.xml ../res/nuclear_concatenated/beast2/unconstrained/combined

# Produce five replicates of a fossil-constrained BEAST phylogeny for the concatenated nuclear data set (separately the set of 28 fossil constraints, with different assumptions for the earliest record of Tetraodontiformes).
ruby run_BEAST_analyses.rb ../res/nuclear_concatenated/beast2/fossil_constrained_28a
ruby run_BEAST_analyses.rb ../res/nuclear_concatenated/beast2/fossil_constrained_28b

# Combine results of fossil-constrained BEAST analyses for the concatenated nuclear dataset.
bash combine_BEAST_trees.sh ../res/nuclear_concatenated/beast2/fossil_constrained_28a/replicates ../res/nuclear_concatenated/beast2/fossil_constrained_28a/combined
bash combine_BEAST_trees.sh ../res/nuclear_concatenated/beast2/fossil_constrained_28b/replicates ../res/nuclear_concatenated/beast2/fossil_constrained_28b/combined
