# m_matschiner Tue Mar 5 13:25:18 CET 2019

# This script reads the wavelength table in which
# some genes have two wavelengths, according to their
# two phased alleles and it writes a table in which
# a certain allele combination is used. Which allele
# combination this should be is specified with a number
# as input.

# Get the command-line arguments.
wavelength_table_file_name = ARGV[0]
number = (ARGV[1].to_i-1).to_s(2).rjust(8).gsub(" ","0")
temporary_wavelength_table_file_name = ARGV[2]

# Read the input file.
wavelength_table_file = File.open(wavelength_table_file_name)
wavelength_table_lines = wavelength_table_file.readlines

# Prepare the output string.
outstring = ""
count = 0
wavelength_table_lines.each do |l|
	if l.include?("/")
		line_ary = l.split
		wavelengths = line_ary[1].split("/")
		outstring << "#{line_ary[0]}\t#{wavelengths[number[count].to_i]}\n"
		count += 1
	else
		outstring << l
	end
end

# Write the output file.
temporary_wavelength_table_file = File.open(temporary_wavelength_table_file_name, "w")
temporary_wavelength_table_file.write(outstring)