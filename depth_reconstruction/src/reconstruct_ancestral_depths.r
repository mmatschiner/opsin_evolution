# m_matschiner Thu Jun 22 16:53:46 CEST 2017

# Load the ape library.
library(ape)

# Read the input table with depths.
table <- read.table("../data/depth_mindepth1.txt")
depth <- log(table$V3)
names(depth) <- table$V1

# Read the input tree.
tree <- read.tree("../data/101g_nucl_conc_28bfossils.combined.tre")

# Reconstruct ancestral states.
MLreconstruction <- ace(depth, tree, type="continuous", method="ML")

pdf("../res/plots/tree.pdf", height=7, width=7)
plot(ladderize(tree), cex=0.3)
nodelabels(format(exp(MLreconstruction$ace),digits=2), frame="none", bg="white", cex=0.3)
dev.off()