# m_matschiner Wed Jul 5 11:57:21 CEST 2017

# Load libraries.
library(ape)

# Get the command line arguments.
args <- commandArgs(trailingOnly = TRUE)
intree_file_name <- args[1]
outtree_file_name <- args[2]
keep_list_file_name <- args[3]

# Read the tree.
tree <- read.nexus(intree_file_name)
tip_list <- tree$tip.label

# Read the list of taxa to keep.
keep_list <- read.table(keep_list_file_name)
keep_list <- as.vector(keep_list$V1)
drop_list <- setdiff(tip_list,keep_list)

# Remove all tips not in the keep list.
pruned_tree <- drop.tip(tree,drop_list)

# Write the pruned tree to file.
write.nexus(pruned_tree,file=outtree_file_name, translate=FALSE)
