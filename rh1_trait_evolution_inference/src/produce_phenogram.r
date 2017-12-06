# Michael Matschiner, 2015-07-09

# Load libraries.
library(phytools)
require(methods)

# Get the command line arguments.
args <- commandArgs(trailingOnly = TRUE)
tree_file_name <- args[1]
table_file_name <- args[2]
phenogram_file_name <- args[3]

# Read the tree.
tree <- read.nexus(tree_file_name)

# Read the wavelengths table.
table <- read.table(table_file_name,header=T)
trait_values <- table$Trait
names(trait_values) <- table$Species

# Produce the phenogram for log copy numbers.
pdf(phenogram_file_name, height=7, width=7)
phenogram(tree, trait_values, spread.labels=TRUE, spread.cost=c(1,0), link=20, offset=1, fsize=0.5)
dev.off()
