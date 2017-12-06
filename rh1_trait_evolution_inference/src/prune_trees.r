# m_matschiner Wed Jul 5 11:57:21 CEST 2017

# Load libraries.
library(phytools)

# Get the command line arguments.
args <- commandArgs(trailingOnly = TRUE)
intrees_file_name <- args[1]
outtrees_file_name <- args[2]
keep_list_file_name <- args[3]

# Read the tree.
trees <- read.nexus(intrees_file_name)
tip_list <- trees$tip.label$tip.label

# Read the list of taxa to keep.
keep_list <- read.table(keep_list_file_name)
keep_list <- as.vector(keep_list$V1)
drop_list <- setdiff(tip_list,keep_list)

# Remove all tips not in the keep list.
pruned_trees <- lapply(trees, drop.tip, tip=drop_list)

# Write the pruned trees to file.
write.nexus(pruned_trees, file=outtrees_file_name, translate=FALSE)