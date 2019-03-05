# m_matschiner Wed Jul 5 12:01:18 CEST 2017

# Make the output directory if it doesn't exist yet.
mkdir -p ../res/trees

# Make a list of tips to keep.
#cat ../data/tables/wavelengths.txt | cut -f 1 > ../data/tables/keep_list.txt

# Prune all taxa from the tree that are not in the keep list.
#rscript prune_trees.r ../data/trees/rod_opsin.trees ../res/trees/rod_opsin_pruned.trees ../data/tables/keep_list.txt
#rscript prune_tree.r ../data/trees/rod_opsin.tre ../res/trees/rod_opsin_pruned.tre ../data/tables/keep_list.txt

# Make another list of tips to keep, this time for those genes that were predicted with the atomistic model.
cat ../data/tables/wavelengths_model_predicted.txt | cut -f 1 > ../data/tables/keep_list_model_predicted.txt

# Prune all taxa from the tree that are not in the keep list for predicted genes.
rscript prune_tree.r ../data/trees/rod_opsin.tre ../res/trees/rod_opsin_pruned_model_predicted.tre ../data/tables/keep_list_model_predicted.txt
