# m_matschiner Mon Jul 17 14:44:04 CEST 2017

# Load the phylsim and array_stats libraries.
$libPath = "./phylsim/"
require "./phylsim/main.rb"
require 'fileutils'

# Get the command-line arguments.
tree_file_name = ARGV[0]
reconstructed_seqs_dir = ARGV[1]
extant_seqs_file_name = ARGV[2]
codeml_path = ARGV[3]
last_digit = ARGV[4]
substitutions_table_file_name = ARGV[5]
dnds_table_file_name = ARGV[6]

# Parse the input tree.
tree = Tree.parse(fileName = ARGV[0], fileType = "nexus", diversityFileName = nil, treeNumber = 0, verbose = false)

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

# Prepare a codeml.ctl file.
control_string = ""
control_string << "      seqfile = tmp.phy   * sequence data file name\n"
control_string << "      outfile = results.txt   * main result file name\n"
control_string << "\n"
control_string << "        noisy = 0      * 0,1,2,3,9: how much rubbish on the screen\n"
control_string << "      verbose = 0      * 1:detailed output\n"
control_string << "      runmode = -2     * -2:pairwise\n"
control_string << "\n"
control_string << "      seqtype = 1      * 1:codons\n"
control_string << "    CodonFreq = 1      * 0:equal, 1:F1X4, 2:F3X4, 3:F61\n"
control_string << "        model = 0      *\n"
control_string << "      NSsites = 0      *\n"
control_string << "        icode = 0      * 0:universal code\n"
control_string << "\n"
control_string << "    fix_kappa = 0      * 1:kappa fixed, 0:kappa to be estimated\n"
control_string << "        kappa = 1      * initial or fixed kappa\n"
control_string << "\n"
control_string << "    fix_omega = 0      * 1:omega fixed, 0:omega to be estimated\n"
control_string << "        omega = 0.5    * initial omega value\n"

# Write the control file to the codeml analysis directory.
Dir.mkdir(last_digit)
control_file = File.open("#{last_digit}/codeml.ctl","w")
control_file.write(control_string)
control_file.close

# Prepare the output tables.
substitutions_table_file = File.open(substitutions_table_file_name,"w")
dnds_table_file = File.open(dnds_table_file_name,"w")
substitutions_table_file.write("id\tsubstitutions\n")
substitutions_table_file.flush
dnds_table_file.write("id\tomega\n")
dnds_table_file.flush

# Loop over branches.
tree.branch.each do |b|

	# Only do this for branches with the right last digit.
	if b.id[-1] == last_digit

		# Add to the output table.
		substitutions_table_line = "#{b.id}\t"
		dnds_table_line = "#{b.id}\t"
		
		# Prepare arrays for substitution count and omega estimates.
		substitution_counts = []
		omega_estimates = []

		# Feedback.
		puts "Analysing branch #{b.id}."

		# Get the posterior sample of desendant sequences.
		descendant_seqs = []
		if b.extant
			1000.times {descendant_seqs << extant_seq_seqs[extant_seq_ids.index(b.speciesId)]}
		else
			reconstructed_descendant_seqs_file = File.open("#{reconstructed_seqs_dir}/#{b.id}.phy")
			reconstructed_descendant_seqs_lines = reconstructed_descendant_seqs_file.readlines
			reconstructed_descendant_seqs_lines[2..-1].each do |l|
				descendant_seqs << l.split[1]
			end
		end

		# Get the posterior sample of ancestral sequences.
		ancestral_seqs = []
		reconstructed_ancestral_seqs_file = File.open("#{reconstructed_seqs_dir}/#{b.parentId}.phy")
		reconstructed_ancestral_seqs_lines = reconstructed_ancestral_seqs_file.readlines
		reconstructed_ancestral_seqs_lines[2..-1].each do |l|
			ancestral_seqs << l.split[1]
		end

		# Move to the codeml analysis directory.
		Dir.chdir(last_digit)

		# Loop over a thousand sampled states.
		1000.times do |sample|

			# Make sure that the ancestral and descendant sequences are of the same length.
			if ancestral_seqs[sample].size != descendant_seqs[sample].size
				puts "WARNING: Ancestral and descendant sequences have different lengths! One of these will be trimmed."
				shorter_length = [ancestral_seqs[sample].size,descendant_seqs[sample].size].min
				ancestral_seqs[sample] = ancestral_seqs[sample][0..shorter_length-1]
				descendant_seqs[sample] = descendant_seqs[sample][0..shorter_length-1]
			end

			# Remove sites that are gaps in both sequences.
			ancestral_seq = ""
			descendant_seq = ""
			ancestral_seqs[sample].size.times do |pos|
				unless ancestral_seqs[sample][pos] == "-" and descendant_seqs[sample][pos] == "-"
					ancestral_seq << ancestral_seqs[sample][pos]
					descendant_seq << descendant_seqs[sample][pos]
				end
			end

			# Give a warning if the ancestral and descendant sequence lengths are not multiples of three.
			if (ancestral_seq.size/3)*3 != ancestral_seq.size
				puts "WARNING: The sequence lengths for sample #{sample} of node #{b.id} and node #{b.parentId} are not multiples of three. They will be trimmed."
				ancestral_seq = ancestral_seq[0..((ancestral_seq.size/3)*3)-1]
				descendant_seq = descendant_seq[0..((descendant_seq.size/3)*3)-1]
			end

			# Remove stop codons if present.
			stop_codons = ["TAG","TAA","TGA"]
			(ancestral_seq.size/3).times do |codon_pos|
				if stop_codons.include?(ancestral_seq[3*codon_pos..3*codon_pos+2])
					puts "WARNING: Replaced stop codon #{ancestral_seq[3*codon_pos..3*codon_pos+2]} at position #{3*codon_pos} in sequence #{sample} of node #{b.parentId}."
					ancestral_seq[3*codon_pos] = "-"
					ancestral_seq[3*codon_pos+1] = "-"
					ancestral_seq[3*codon_pos+2] = "-"
				end
			end
			(descendant_seq.size/3).times do |codon_pos|
				if stop_codons.include?(descendant_seq[3*codon_pos..3*codon_pos+2])
					puts "WARNING: Replaced stop codon #{descendant_seq[3*codon_pos..3*codon_pos+2]} at position #{3*codon_pos} in sequence #{sample} of node #{b.id}."
					descendant_seq[3*codon_pos] = "-"
					descendant_seq[3*codon_pos+1] = "-"
					descendant_seq[3*codon_pos+2] = "-"
				end
			end

			# Calculate the number of substitutions on this branch.
			substitution_count = 0
			ancestral_seq.size.times do |pos|
				if ["A","C","G","T"].include?(ancestral_seq[pos]) and ["A","C","G","T"].include?(descendant_seq[pos])
					substitution_count += 1 if ancestral_seq[pos] != descendant_seq[pos]
				end
			end
			substitution_counts << substitution_count.to_f

			# Write a phylip file with only the ancestral and descendant sequences.
			tmp_phylip_string = "2 #{ancestral_seq.size}\n"
			tmp_phylip_string << "anc       #{ancestral_seq}\n"
			tmp_phylip_string << "dec       #{descendant_seq}\n"
			tmp_phylip_file = File.open("tmp.phy","w")
			tmp_phylip_file.write(tmp_phylip_string)
			tmp_phylip_file.close

			# Run codeml with codeml.ctl and file tmp.fasta
			system("codeml > codeml.out")
				
			# Read the codeml results file.
			result_file = File.open("results.txt")
			result_lines = result_file.readlines

			# Make sure codeml has run without errors.
			unless result_lines.size == 89
				puts "ERROR: Unexpected length of codeml result file!"
				puts result_lines
				exit 1
			end

			# Parse the result file and store the omega estimate.
			result_lines[-1].match(/dN\/dS=\s+(\d+\.\d+)/)
			if $1 == nil
				puts "ERROR: The omega estimate could not be parsed!"
				puts "result lines are: #{result_lines}"
				exit 1
			else
				omega_estimates << $1.to_f
			end

			# Delete codeml output files.
			File.delete("results.txt")
			File.delete("2ML.dN")
			File.delete("2ML.dS")
			File.delete("2ML.t")
			File.delete("2NG.dN")
			File.delete("2NG.dS")
			File.delete("2NG.t")
			File.delete("rst")
			File.delete("rub")
			File.delete("rst1")
			File.delete("codeml.out")

			# Delete the reduced phylip file.
			File.delete("tmp.phy")

		end

		# Move up to the directory above.
		Dir.chdir("..")

		# Add statistics about estimates to the output table string.
		substitution_counts.each {|i| substitutions_table_line << "#{i},"}
		substitutions_table_line.chomp!(",")
		substitutions_table_line << "\n"
		substitutions_table_file.write(substitutions_table_line)
		substitutions_table_file.flush

		omega_estimates.each {|i| dnds_table_line << "#{i},"}
		dnds_table_line.chomp!(",")
		dnds_table_line << "\n"
		dnds_table_file.write(dnds_table_line)
		dnds_table_file.flush

	end

end

# Clean up.
FileUtils.rm_r(last_digit)
