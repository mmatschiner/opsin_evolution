# m_matschiner Fri Jul 21 14:05:41 CEST 2017

# Get the command-line arguments.
args <- commandArgs(trailingOnly = TRUE)
diretmid_dnds_table_file_name <- args[1]
nondiretmid_dnds_table_file_name <- args[2]
plot_file_name <- args[3]

# Read the two dnds tables.
td <- read.table(diretmid_dnds_table_file_name)
tnd <- read.table(nondiretmid_dnds_table_file_name)

# Run a t-test on the two distributions.
t.test(td,tnd)

# Produce a plot of dnds distributions.
pdf(plot_file_name, height=7, width=7)
plot(density(tnd$V1,from=0,to=3,bw=0.1),main="dN/dS inside and outside Diretmidae",xlab="omega")
lines(density(td$V1,from=0,to=3,bw=0.1),col="red")
dev.off()
