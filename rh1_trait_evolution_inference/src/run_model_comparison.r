# m_matschiner Wed Jul  5 14:23:53 CEST 2017

# Load required libraries.
library(geiger)
library(picante)
library(phytools)

# Get the command line arguments.
args <- commandArgs(trailingOnly = TRUE)
tree_file_name <- args[1]
data_file_name <- args[2]

# Read the pruned phylogenetic tree.
tree <- read.nexus(tree_file_name)

# Read the table of trait values.
data <- read.table(data_file_name, header=T)
traits <- data$Trait
names(traits) <- data$Species

# # Use the phylosignal function of the picante package to test for phylogenetic signal, measured with the K statistic.
# K ~ 1.0 suggests Brownian motion, K < 1 indicates less resemblance among relatives than expected under Brownian motion,
# and K > 1 indicates more resemblance among relatives than expected under Brownian motion (Blomberg et al., 2003, Evolution, 57:717-745).
cat("\n----------------------------------------picante----------------------------------------\n\n")
phylosignal(traits, tree)

# Use the phylosig function of the phytools package to test for phylogenetic signal, measured with Pagel's lambda.
# Pagel's lambda is 0 <= lambda <= 1, with lambda ~ 0 indicating no phylogenetic signal, and lambda ~ 1 indicating as much
# phylogenetic signal as expected under Brownian motion (Pagel, 1999, Nature, 401:877-884).
cat("\n----------------------------------------phytools----------------------------------------\n\n")
phylosig(tree, traits, method="lambda", test=TRUE)

# Compare the fit of standard single-regime models, using geiger.
cat("\n-------------------------------------geiger: aicc-------------------------------------\n\n")
bm.model <- fitContinuous(tree, traits, model="BM")
white.model <- fitContinuous(tree, traits, model="white")
ou.model <- fitContinuous(tree, traits, model="OU")
eb.model <- fitContinuous(tree, traits, model="EB")
aic_values <- c(bm.model$opt$aic,white.model$opt$aic,ou.model$opt$aic,eb.model$opt$aic)
aicc_values <- c(bm.model$opt$aicc,white.model$opt$aicc,ou.model$opt$aicc,eb.model$opt$aicc)
names(aicc_values) <- c("bm","white_noise","ou","eb")
names(aic_values) <- c("bm","white_noise","ou","eb")
aicc_values
cat("\n-------------------------------------geiger: aic-------------------------------------\n\n")
aic_values

cat("\n---------------------------------geiger: early burst---------------------------------\n\n")
eb.model
