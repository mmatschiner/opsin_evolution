# m_matschiner Thu Jul 20 12:34:20 CEST 2017

class String
	def to_aa
		if self.upcase == "AAA"
			"K"
		elsif self.upcase == "AAC"
			"N"
		elsif self.upcase == "AAG"
			"K"
		elsif self.upcase == "AAT"
			"N"
		elsif self.upcase == "ACA"
			"T"
		elsif self.upcase == "ACC"
			"T"
		elsif self.upcase == "ACG"
			"T"
		elsif self.upcase == "ACT"
			"T"
		elsif self.upcase == "AGA"
			"R"
		elsif self.upcase == "AGC"
			"S"
		elsif self.upcase == "AGG"
			"R"
		elsif self.upcase == "AGT"
			"S"
		elsif self.upcase == "ATA"
			"I"
		elsif self.upcase == "ATC"
			"I"
		elsif self.upcase == "ATG"
			"M"
		elsif self.upcase == "ATT"
			"I"
		elsif self.upcase == "CAA"
			"Q"
		elsif self.upcase == "CAC"
			"H"
		elsif self.upcase == "CAG"
			"Q"
		elsif self.upcase == "CAT"
			"H"
		elsif self.upcase == "CCA"
			"P"
		elsif self.upcase == "CCC"
			"P"
		elsif self.upcase == "CCG"
			"P"
		elsif self.upcase == "CCT"
			"P"
		elsif self.upcase == "CGA"
			"R"
		elsif self.upcase == "CGC"
			"R"
		elsif self.upcase == "CGG"
			"R"
		elsif self.upcase == "CGT"
			"R"
		elsif self.upcase == "CTA"
			"L"
		elsif self.upcase == "CTC"
			"L"
		elsif self.upcase == "CTG"
			"L"
		elsif self.upcase == "CTT"
			"L"
		elsif self.upcase == "GAA"
			"E"
		elsif self.upcase == "GAC"
			"D"
		elsif self.upcase == "GAG"
			"E"
		elsif self.upcase == "GAT"
			"D"
		elsif self.upcase == "GCA"
			"A"
		elsif self.upcase == "GCC"
			"A"
		elsif self.upcase == "GCG"
			"A"
		elsif self.upcase == "GCT"
			"A"
		elsif self.upcase == "GGA"
			"G"
		elsif self.upcase == "GGC"
			"G"
		elsif self.upcase == "GGG"
			"G"
		elsif self.upcase == "GGT"
			"G"
		elsif self.upcase == "GTA"
			"V"
		elsif self.upcase == "GTC"
			"V"
		elsif self.upcase == "GTG"
			"V"
		elsif self.upcase == "GTT"
			"V"
		elsif self.upcase == "TAA"
			"*"
		elsif self.upcase == "TAC"
			"Y"
		elsif self.upcase == "TAG"
			"*"
		elsif self.upcase == "TAT"
			"Y"
		elsif self.upcase == "TCA"
			"S"
		elsif self.upcase == "TCC"
			"S"
		elsif self.upcase == "TCG"
			"S"
		elsif self.upcase == "TCT"
			"S"
		elsif self.upcase == "TGA"
			"*"
		elsif self.upcase == "TGC"
			"C"
		elsif self.upcase == "TGG"
			"W"
		elsif self.upcase == "TGT"
			"C"
		elsif self.upcase == "TTA"
			"L"
		elsif self.upcase == "TTC"
			"F"
		elsif self.upcase == "TTG"
			"L"
		elsif self.upcase == "TTT"
			"F"
		else
			STDERR.puts "ERROR: Unexpected codon: #{self}!"
			exit 1
		end
	end
end

# Load the phylsim library.
$libPath = "./phylsim/"
require "./phylsim/main.rb"

# Get the command-line arguments.
tree_file_name = ARGV[0]
reconstructed_seqs_dir = ARGV[1]
extant_seqs_file_name = ARGV[2]
key_tuning_sites_file_name = ARGV[3]
sample_size = 1000
confidence_threshold = ARGV[4].to_f

# Parse the input tree.
tree = Tree.parse(fileName = ARGV[0], fileType = "nexus", diversityFileName = nil, treeNumber = 0, verbose = false)

# Read the table of key tuning sites.
key_tuning_sites_file = File.open(key_tuning_sites_file_name)
key_tuning_sites_lines = key_tuning_sites_file.readlines
key_tuning_sites_table_our_pos = []
key_tuning_sites_table_bov_pos = []
key_tuning_sites_table_key_tuning_sites = []
key_tuning_sites_lines[1..-1].each do |l|
	line_ary = l.split
	key_tuning_sites_table_our_pos << line_ary[0]
	key_tuning_sites_table_bov_pos << line_ary[1]
	key_tuning_sites_table_key_tuning_sites << line_ary[3]
end
key_tuning_sites = []
key_tuning_sites_table_bov_pos.size.times do |x|
	if key_tuning_sites_table_key_tuning_sites[x] == "TRUE"
		key_tuning_sites << key_tuning_sites_table_bov_pos[x] unless key_tuning_sites.include?(key_tuning_sites_table_bov_pos[x])
	end
end

# Read the file of extant sequences.
extant_seqs_file = File.open(extant_seqs_file_name)
extant_seqs_lines = extant_seqs_file.readlines
extant_seq_ids = []
extant_seq_seqs = []
extant_seqs_lines[1..-1].each do |l|
	line_ary = l.split
	extant_seq_ids << line_ary[0]
	extant_seq_seqs << line_ary[1]
end

# Get the reconstructed consensus sequences from alignment files.
reconstructed_seq_ids = []
reconstructed_seq_seqs = []
dir_entries = []
Dir.entries(reconstructed_seqs_dir).each {|e| dir_entries << e unless e[0] == "." }
dir_entries.each do |e|
	reconstructed_seq_ids << e.chomp(".phy")
	reconstructed_seq_file = File.open("#{reconstructed_seqs_dir}/#{e}")
	reconstructed_seq_lines = reconstructed_seq_file.readlines
	reconstructed_seq_seqs_for_this_branch = []
	reconstructed_seq_lines[1..-1].each do |l|
		reconstructed_seq_seqs_for_this_branch << l.split[1]
	end
	reconstructed_seq_seqs << reconstructed_seq_seqs_for_this_branch
end

# Get the set of sequences at the root node.
treeOrigin_seqs = reconstructed_seq_seqs[reconstructed_seq_ids.index("treeOrigin")]

# Get the three positions in our nucleotide alignment that correspond to the position of the key tuning site.
key_tuning_sites_nucleotide_start_pos = []
key_tuning_sites.each do |k|
	nucleotide_positions = []
	key_tuning_sites_table_our_pos.size.times do |x|
		if key_tuning_sites_table_bov_pos[x] == k
			nucleotide_positions << key_tuning_sites_table_our_pos[x].to_i
		end
	end
	# Make sure that three nucleotide positions are found.
	unless nucleotide_positions.size == 3
		puts "ERROR! Number of nucleotide positions is not 3!"
		exit 1
	end
	# Make sure that the three nucleotide positions are contiguous.
	nucleotides_contiguous = true
	nucleotides_contiguous = false if nucleotide_positions[2] != nucleotide_positions[1] + 1
	nucleotides_contiguous = false if nucleotide_positions[1] != nucleotide_positions[0] + 1
	unless nucleotides_contiguous
		puts "ERROR! Nucleotide positions are not contiguous!"
		exit 1
	end
	# Memorize the first of the three nucleotide positions.
	key_tuning_sites_nucleotide_start_pos << nucleotide_positions[0]
end

# For each extant branch check if one of its key tuning sites is different from the key tuning site at the root.
changes = []
tree.branch.each do |b|
	if b.extant
		extant_seq = extant_seq_seqs[extant_seq_ids.index(b.speciesId)]
		key_tuning_sites.size.times do |x|
			change_occurred = false
			ancestor_ids = []
			ancestor_child_ids = []
			ancestor_child_species_ids = []
			ancestor_most_common_aas = []
			ancestor_most_common_aa_frequencies = []
			change_bpps = []
			extant_codon = extant_seq[key_tuning_sites_nucleotide_start_pos[x]-1..key_tuning_sites_nucleotide_start_pos[x]+1]
			ancestor_id = b.parentId
			ancestor_child_id = b.id
			ancestor_child_species_id = b.speciesId
			root_reached = false
			unless ["?","N","-","M","K","R","S","Y","W"].include?(extant_codon[0]) or ["?","N","-","M","K","R","S","Y","W"].include?(extant_codon[1]) or ["?","N","-","M","K","R","S","Y","W"].include?(extant_codon[2])
				extant_aa = extant_codon.to_aa
				until root_reached
					root_reached = true if ancestor_id == "treeOrigin"
					# Calculate the probability of a change since this ancestor.
					ancestral_seqs = reconstructed_seq_seqs[reconstructed_seq_ids.index(ancestor_id)]
					ancestral_codons = []
					ancestral_seqs.each do |s|
						ancestral_codons << s[key_tuning_sites_nucleotide_start_pos[x]-1..key_tuning_sites_nucleotide_start_pos[x]+1]
					end
					ancestor_aas = []
					change_bpp = 0
					ancestral_codons.each do |c|
						unless ["?","N","-","M","K","R","S","Y","W"].include?(c[0]) or ["?","N","-","M","K","R","S","Y","W"].include?(c[1]) or ["?","N","-","M","K","R","S","Y","W"].include?(c[2])
							ancestral_aa = c.to_aa
							ancestor_aas << ancestral_aa
							change_bpp += 1.0/ancestral_codons.size if extant_aa != ancestral_aa
						end
					end
					# Find the most common ancestral amino acid of this ancestor.
					unique_ancestor_aas = ancestor_aas.uniq
					unique_ancestral_aa_frequencies = []
					unique_ancestor_aas.each do |u|
						unique_ancestral_aa_frequencies << ancestor_aas.count(u).to_f/(sample_size+1)
					end
					most_frequent_index = unique_ancestral_aa_frequencies.index(unique_ancestral_aa_frequencies.max)

					# Store results for this ancestor.
					ancestor_ids << ancestor_id
					ancestor_child_ids << ancestor_child_id
					ancestor_child_species_ids << ancestor_child_species_id
					change_bpps << change_bpp
					ancestor_most_common_aas << unique_ancestor_aas[most_frequent_index]
					ancestor_most_common_aa_frequencies << unique_ancestral_aa_frequencies.max

					# If support for a change on this branch is sufficient, mark this key tuning site for further analysis.
					if change_bpp > confidence_threshold
						change_bpp_increase = []
						previous_bpp = 0
						change_bpps.each do |i|
							change_bpp_increase << i - previous_bpp
							previous_bpp = i
						end

						puts "Gene: #{b.speciesId}   Key tuning site: #{key_tuning_sites[x]}   AA in extant gene: #{extant_aa}"
						puts "    Branch   Key tuning site                                                      Gene   BPP(change since branch orgin)   BPP increase    AA at branch origin   AA at branch termination"
						ancestor_ids.size.times do |y|
							outline = "      #{ancestor_child_ids[y].rjust(4)}   #{key_tuning_sites[x].rjust(15)}   #{ancestor_child_species_ids[y].rjust(55)}   #{('%.3f' % (change_bpps[y])).rjust(30)}   #{('%.3f' % (change_bpp_increase[y])).rjust(12)}"
							if change_bpp_increase[y] == change_bpp_increase.max
								outline << "*"
							else
								outline << " "
							end
							outline << "          #{ancestor_most_common_aas[y]} [BPP=#{'%.3f' % (ancestor_most_common_aa_frequencies[y])}]"
							if y == 0
								outline << "             #{extant_aa} [BPP=1.000]"
							else
								outline << "             #{ancestor_most_common_aas[y-1]} [BPP=#{'%.3f' % (ancestor_most_common_aa_frequencies[y-1])}]"
							end
							puts outline
						end
						puts
						break

					# If not, find the next-oldest ancestor and go to the beginning of the loop.
					elsif root_reached == false
						new_ancestor_found = false
						tree.branch.each do |bb|
							if bb.id == ancestor_id
								ancestor_child_id = ancestor_id
								ancestor_child_species_id = "-"
								ancestor_id = bb.parentId
								new_ancestor_found = true
								break
							end
						end
						if new_ancestor_found == false
							puts "ERROR: New ancestor of branch #{b.id} could not be found (current ancestor: #{ancestor_id})!"
							exit 1
						end
					end
				end
			end
		end
	end
end
