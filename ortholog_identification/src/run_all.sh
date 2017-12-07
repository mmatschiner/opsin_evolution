# m_matschiner Wed Dec  6 20:39:10 CET 2017

# Download genome assemblies from NCBI, ENSEMBL, ENA, and Dryad.
bash download_assemblies.sh

# Identification of nuclear orthologs:
bash find_orthologs_nuclear.sh ../data/queries/nuclear/exons.fasta ../data/subjects/nuclear.txt ../res/alignments/nuclear/01/

# Filtering of nuclear ortholog alignments:
# 1: For each exon, remove bitscore outliers.
ruby filter_sequences_by_bitscore.rb ../res/alignments/nuclear/01/ ../res/alignments/nuclear/02/ 0.8

# 2: For each exon, remove sequences that are dN/dS outliers when compared with Danrer.
ruby filter_sequences_by_dNdS.rb ../res/alignments/nuclear/02/ ../res/alignments/nuclear/03/ 0.5

# 3: For each exon, remove poorly aligned sites and sites with too much missing data with BMGE.
ruby filter_sites_with_BMGE.rb ../res/alignments/nuclear/03/ ../res/alignments/nuclear/04

# 4: Remove exons with too much missing data.
ruby filter_exons_by_missing_data.rb ../res/alignments/nuclear/04/ ../res/alignments/nuclear/05/ 10 120

# 5: Remove third codon positions.
ruby filter_sites_by_codon_position.rb ../res/alignments/nuclear/05/ ../res/alignments/nuclear/06

# 6: Remove exons that are outliers in GC content variation.
ruby filter_exons_by_GC_content_variation.rb ../res/alignments/nuclear/06/ ../res/alignments/nuclear/07/ 0.05

# 7: Remove genes with too few exon alignments.
ruby filter_genes_by_exon_number.rb ../res/alignments/nuclear/07/ ../res/alignments/nuclear/08/ ../data/genes.dmp 3

# 8: For each gene, run Concaterpillar with all exons, and remove those that do not fall into the main cluster.
ruby filter_genes_by_exon_tree_congruence.rb ../res/alignments/nuclear/08/ ../res/alignments/nuclear/09/ 5

# 9: Remove genes that are the least clock-like.
# 9a: Produce XML files for all alignments.
bash filter_genes_by_clock_variation_1.sh ../res/alignments/nuclear/09/
# 9b: Run BEAST with all XML files.
bash filter_genes_by_clock_variation_2.sh ../res/alignments/nuclear/09/
# 9c: Read BEAST log files and filter according to coefficent of variation.
ruby filter_genes_by_clock_variation_3.rb ../res/alignments/nuclear/09/ ../res/alignments/nuclear/10/
