# m_matschiner Mon Jul 17 11:59:49 CEST 2017

# Load the phylsim library.
$libPath = "./phylsim/"
require "./phylsim/main.rb"

# Get the command line arguments.
tree_file_name = ARGV[0]
nucleotides_res_dir = ARGV[1]
indels_res_dir = ARGV[2]
indels_def_file_name = ARGV[3]
alignment_file_name = ARGV[4]
output_dir = ARGV[5]

# Parse the input tree.
tree = Tree.parse(fileName = ARGV[0], fileType = "nexus", diversityFileName = nil, treeNumber = 0, verbose = false)

# Read the alignment file.
alignment_file = File.open(alignment_file_name)
alignment_lines = alignment_file.readlines
alignment_ids = []
alignment_seqs = []
alignment_lines[1..-1].each do |l|
	line_ary = l.split
	alignment_ids << line_ary[0]
	alignment_seqs << line_ary[1]
end
max_alignment_id_length = 0
alignment_ids.each do |i|
	max_alignment_id_length = i.size if i.size > max_alignment_id_length
end

# Make an array of internal node (rather than branch) ids.
node_ids = ["treeOrigin"]
tree.branch.each do |b|
	node_ids << b.id unless b.extant
end

# Find the positions of indels.
indel_froms = []
indel_tos = []
indels_def_file = File.open(indels_def_file_name)
indels_def_lines = indels_def_file.readlines
in_charstatelabels = false
indels_def_lines.each do |l|
	if l.strip == "charstatelabels"
		in_charstatelabels = true
	elsif l.strip == ";"
		in_charstatelabels = false
	elsif in_charstatelabels
		line_ary = l.split[4].chomp("'").split("-")
		indel_froms << line_ary[0].to_i
		indel_tos << line_ary[1].to_i
	end
end

# Loop over all nodes.
node_ids.each do |n|

	# Loop over a thousand sampled states.
	sequences = []
	1000.times do |sample|

		# Get the indel states for this node and sample.
		indel_reconstruction_file = File.open("#{indels_res_dir}/#{n}.log")
		indel_reconstruction_lines = indel_reconstruction_file.readlines
		indel_states = indel_reconstruction_lines[sample+1].split[1..-3]

		# Get the nucleotide states for this node and sample.
		nucleotide_reconstruction_file = File.open("#{nucleotides_res_dir}/#{n}.log")
		nucleotide_reconstruction_lines = nucleotide_reconstruction_file.readlines
		nucleotide_states = nucleotide_reconstruction_lines[sample+1].split[1..-1]

		# Mask nucleotide states according to indel states.
		indel_states.size.times do |x|
			if indel_states[x] == "0"
				indel_from = indel_froms[x]-1
				indel_to = indel_tos[x]-1
				indel_from.upto(indel_to) do |pos|
					nucleotide_states[pos] = "?"
				end
			end
		end

		# Convert states to nucleotide sequences.
		sequence = ""
		nucleotide_states.each do |s|
			if s == "0"
				sequence << "A"
			elsif s == "1"
				sequence << "C"
			elsif s == "2"
				sequence << "G"
			elsif s == "3"
				sequence << "T"
			elsif s == "?"
				sequence << "-"
			else
				puts "ERROR: Unexpected state: #{s}!"
				exit 1
			end
		end

		# Store sequence.
		sequences << sequence
	end

	# Make a consensus sequence.
	consensus_sequence = ""
	sequences[0].size.times do |pos|
		states_at_this_pos = []
		sequences.each do |s|
			states_at_this_pos << s[pos]
		end
		a_count = states_at_this_pos.count("A")
		c_count = states_at_this_pos.count("C")
		g_count = states_at_this_pos.count("G")
		t_count = states_at_this_pos.count("T")
		n_count = states_at_this_pos.count("-")
		if a_count + c_count + g_count + t_count + n_count != 1000
			puts "ERROR: The sum of states is not equal to 1000 (branch: #{b.id}, position: #{pos}, A: #{a_count}, C: #{c_count}, G: #{g_count}, T: #{t_count}, -: #{n_count})!"
		end
		sorted_counts = [a_count,c_count,g_count,t_count,n_count].sort.reverse
		if sorted_counts[0] == sorted_counts[1]
			puts "WARNING: Two states are equally probably at position #{pos}, for node #{n}!"
		end
		if a_count == sorted_counts[0]
			consensus_sequence << "A"
		elsif c_count == sorted_counts[0]
			consensus_sequence << "C"
		elsif g_count == sorted_counts[0]
			consensus_sequence << "G"
		elsif t_count == sorted_counts[0]
			consensus_sequence << "T"
		elsif n_count == sorted_counts[0]
			consensus_sequence << "-"
		else
			puts "ERROR: Most common state could not be determined!"
			exit 1
		end
	end

	# Prepare a output file in phylip format.
	phylip_string = "#{sequences.size+1} #{sequences[0].size}\n"
	phylip_string << "consensus  #{consensus_sequence}\n"
	sequences.size.times do |x|
		phylip_string << "#{x.to_s.ljust(9)}  #{sequences[x]}\n"
	end

	# Write the output file in phylip format.
	phylip_file_name = "#{output_dir}/#{n}.phy"
	phylip_file = File.open(phylip_file_name,"w")
	phylip_file.write(phylip_string)

end
