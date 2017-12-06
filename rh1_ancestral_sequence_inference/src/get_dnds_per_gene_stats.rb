# m_matschiner Mon Dec 4 15:09:55 CET 2017

# Include the array_stats library.
require "./array_stats.rb"

# Get command-line arguments.
dnds_table_file_name = ARGV[0]

# Read the table file.
dnds_table_file = File.open(dnds_table_file_name)
dnds_table_lines = dnds_table_file.readlines

# Analyse the table file.
puts "#{"Gene".ljust(65)}\t#{"Mean".rjust(10)}\t#{"Median".rjust(10)}\t#{"95\% HPD lower".rjust(13)}\t#{"95\% HPD upper".rjust(13)}"
dnds_table_lines[1..-1].each do |l|
	line_ary = l.split
	gene_id = line_ary[0]
	dnds_values = []
	line_ary[1].split(",").each{|i| dnds_values << i.to_f}
	puts "#{gene_id.ljust(65)}\t     #{'%.3f' % dnds_values.mean}\t     #{'%.3f' % dnds_values.median}\t        #{'%.3f' % dnds_values.hpd_lower(0.95)}\t        #{'%.3f' % dnds_values.hpd_upper(0.95)}"
end