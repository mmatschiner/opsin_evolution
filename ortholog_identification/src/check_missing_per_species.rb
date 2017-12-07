## Michael Matschiner 2015-07-31.

require "./array_stats.rb"

# Get the command line arguments.
alignment_directory_in = ARGV[0]

# Collect names of nucleotide fasta files in the input directory.
dir_entries_in = Dir.entries(alignment_directory_in)
filenames_in = []
dir_entries_in.each {|e| filenames_in << e if e.match(/.*_nucl.fasta/)}

# Create an array to store the number of missing sequences per species.
species_ids = []
missing_per_species = []

# Do for each fasta file in the input directory.
filenames_in.each do |f|

	# Read the fasta file.
	fasta_file = File.open("#{alignment_directory_in}/#{f}")
	fasta_lines = fasta_file.readlines
	fasta_ids = []
	fasta_bitscores = []
	fasta_hits = []
	fasta_seqs = []
	fasta_lines.each do |l|
		if l[0] == ">"
			fasta_ids << l[1..-1].strip.sub(/\[.*\]/,"")
			fasta_seqs << ""
		else
			fasta_seqs.last << l.strip
		end
	end

	# If this is the first file, initiate the array with the number of missing sequences per species.
	if missing_per_species == []
		fasta_ids.size.times do |x|
			species_ids << fasta_ids[x]
			missing_per_species << 0
		end
	end

	fasta_ids.size.times do |x|
		if fasta_seqs[x].match(/^-+$/)
			missing_per_species[species_ids.index(fasta_ids[x])] += 1
		end
	end

end

species_ids.size.times do |x|
	puts "#{species_ids[x]}\t#{missing_per_species[x]}"
end