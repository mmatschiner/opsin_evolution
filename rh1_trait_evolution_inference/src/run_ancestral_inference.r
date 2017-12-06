# m_matschiner Wed Jul  5 15:48:28 CEST 2017

# Load libraries.
library(Rphylopars)
library(phytools)

# Get the command line arguments.
args <- commandArgs(trailingOnly = TRUE)
tree_file_name <- args[1]
table_file_name <- args[2]
node_label_file_name <- args[3]

# Read the tree.
tree <- read.nexus(tree_file_name)

# Read the wavelengths table.
data <- read.table(table_file_name,header=T)
colnames(data) <- c("species","Trait")
rownames(data) <- data$species

# Fit a Brownian Motion model.
p_BM <- phylopars(trait_data = data,tree = tree)

# Fit an Ornstein-Uhlenbeck model.
p_OU <- phylopars(trait_data = data,tree = tree,model="OU")

# Fit an early burst model.
p_EB <- phylopars(trait_data = data,tree = tree,model="EB")

# Fit a white noise model.
p_WN <- phylopars(trait_data = data,tree = tree,model="star")

# Report AIC values of all models.
aic_values <- c(AIC(p_BM),AIC(p_WN),AIC(p_OU),AIC(p_EB))
names(aic_values) <- c("bm","white_noise","ou","eb")
cat("\n-------------------------------------Rphylopars: aic-------------------------------------\n\n")
aic_values

# Report details of the Early Burst model.
cat("\n-------------------------------------Rphylopars: EB-------------------------------------\n\n")
p_EB

# Report the reconstructed ancestral states.
cat("\n---------------------------------Rphylopars: EB: states---------------------------------\n\n")
p_EB$anc_recon

# For comparison, plot a tree with node labels.
pdf(node_label_file_name, height=7, width=7)
plot.phylo(reorder(tree,"postorder"))
nodelabels()
dev.off()
