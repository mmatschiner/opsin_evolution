# m_matschiner Mon Jul 17 14:44:04 CEST 2017

# Load the array_stats libraries.
require 'fileutils'

# Get the command-line arguments.
treeOrigin_seqs_file_name = ARGV[0]
extant_seqs_file_name = ARGV[1]
codeml_path = ARGV[2]
dnds_table_file_name = ARGV[3]

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

# Read the file of reconstructed sequences for the treeOrigin.
treeOrigin_seqs_file = File.open(treeOrigin_seqs_file_name)
treeOrigin_seqs_lines = treeOrigin_seqs_file.readlines
treeOrigin_seq_ids = []
treeOrigin_seq_seqs = []
treeOrigin_seqs_lines[1..-1].each do |l|
	line_ary = l.split
	treeOrigin_seq_ids << line_ary[0]
	treeOrigin_seq_seqs << line_ary[1]
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
Dir.mkdir("tmp")
control_file = File.open("tmp/codeml.ctl","w")
control_file.write(control_string)
control_file.close

# Prepare the output tables.
dnds_table_file = File.open(dnds_table_file_name,"w")
dnds_table_file.write("id\tomega\n")
dnds_table_file.flush

# Move to the codeml analysis directory.
Dir.chdir("tmp")

# Calculate dN/dS for each extant sequence.
extant_seq_ids.size.times do |x|

	# Add to the output table.
	dnds_table_line = "#{extant_seq_ids[x]}\t"

	# Prepare arrays for omega estimates.
	omega_estimates = []

	# Loop over a thousand sampled states.
	1000.times do |sample|

		treeOrigin_seq = treeOrigin_seq_seqs[sample]
		extant_seq = extant_seq_seqs[x]
		# Make sure that the ancestral and descendant sequences are of the same length.
		if treeOrigin_seq.size != extant_seq.size
			puts "WARNING: Ancestral and extant sequences have different lengths! One of these will be trimmed."
			shorter_length = [treeOrigin_seq.size,extant_seq.size].min
			treeOrigin_seq = treeOrigin_seq[0..shorter_length-1]
			extant_seq = extant_seq[0..shorter_length-1]
		end

		# Remove sites that are gaps in both sequences.
		treeOrigin_seq_clean = ""
		extant_seq_clean = ""
		treeOrigin_seq.size.times do |pos|
			unless treeOrigin_seq[pos] == "-" and extant_seq[pos] == "-"
				treeOrigin_seq_clean << treeOrigin_seq[pos]
				extant_seq_clean << extant_seq[pos]
			end
		end

		# Give a warning if the ancestral and descendant sequence lengths are not multiples of three.
		if (treeOrigin_seq_clean.size/3)*3 != treeOrigin_seq_clean.size
			puts "WARNING: The sequence lengths for sample #{sample} of taxon #{extant_seq_ids[x]} are not multiples of three. They will be trimmed."
			treeOrigin_seq_clean = treeOrigin_seq_clean[0..((treeOrigin_seq_clean.size/3)*3)-1]
			extant_seq_clean = extant_seq_clean[0..((extant_seq_clean.size/3)*3)-1]
		end

		# Remove stop codons if present.
		stop_codons = ["TAG","TAA","TGA"]
		(treeOrigin_seq_clean.size/3).times do |codon_pos|
			if stop_codons.include?(treeOrigin_seq_clean[3*codon_pos..3*codon_pos+2])
				puts "WARNING: Replaced stop codon #{treeOrigin_seq_clean[3*codon_pos..3*codon_pos+2]} at position #{3*codon_pos} in sequence #{sample} of the treeOrigin sequences."
				treeOrigin_seq_clean[3*codon_pos] = "-"
				treeOrigin_seq_clean[3*codon_pos+1] = "-"
				treeOrigin_seq_clean[3*codon_pos+2] = "-"
			end
		end
		(extant_seq_clean.size/3).times do |codon_pos|
			if stop_codons.include?(extant_seq_clean[3*codon_pos..3*codon_pos+2])
				puts "WARNING: Replaced stop codon #{extant_seq_clean[3*codon_pos..3*codon_pos+2]} at position #{3*codon_pos} in taxon #{extant_seq_ids[x]}."
				extant_seq_clean[3*codon_pos] = "-"
				extant_seq_clean[3*codon_pos+1] = "-"
				extant_seq_clean[3*codon_pos+2] = "-"
			end
		end

		# Write a phylip file with only the ancestral and descendant sequences.
		tmp_phylip_string = "2 #{treeOrigin_seq_clean.size}\n"
		tmp_phylip_string << "anc       #{treeOrigin_seq_clean}\n"
		tmp_phylip_string << "dec       #{extant_seq_clean}\n"
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

	omega_estimates.each {|i| dnds_table_line << "#{i},"}
	dnds_table_line.chomp!(",")
	dnds_table_line << "\n"
	dnds_table_file.write(dnds_table_line)
	dnds_table_file.flush

end

# Move up to the directory above.
Dir.chdir("..")

# Clean up.
FileUtils.rm_r("tmp")
