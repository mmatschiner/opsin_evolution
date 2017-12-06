# m_matschiner Wed Jul  5 13:08:07 CEST 2017

# Load the geiger library.
library(geiger)

# Get the command-line arguments.
args <- commandArgs(trailingOnly = TRUE)
intree_file_name <- args[1]
trait_table_file_name <- args[2]

# Read the tree.
tree<-read.nexus(intree_file_name)

# Read the trait table.
table <- read.table(trait_table_file_name, header=TRUE, sep="\t")
matrix <- as.matrix(table$Trait)
rownames(matrix) <- table$Species

# Analyse disparity through time.
dtt(tree,matrix,nsim=1000,mdi.range=c(0,1))
