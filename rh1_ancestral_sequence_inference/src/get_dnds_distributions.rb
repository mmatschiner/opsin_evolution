# m_matschiner Fri Jul 21 13:34:22 CEST 2017

# Load the phylsim library.
$libPath = "./phylsim/"
require "./phylsim/main.rb"

# Get the command-line arguments.
dnds_table_file_name = ARGV[0]
tree_file_name = ARGV[1]
diretmidae_branch_id = ARGV[2]
diretmid_dnds_table_file_name = ARGV[3]
nondiretmid_dnds_table_file_name = ARGV[4]

# Read the dnds table file.
dnds_table_file = File.open(dnds_table_file_name)
dnds_table_lines = dnds_table_file.readlines
dnds_table_ids = []
dnds_table_value_strings = []
dnds_table_lines[1..-1].each do |l|
	dnds_table_ids << l.split[0]
	dnds_table_value_strings << l.split[1]
end

# Parse the input tree.
tree = Tree.parse(fileName = ARGV[1], fileType = "nexus", diversityFileName = nil, treeNumber = 0, verbose = false)

# Get the ids of branches descending from the root branch of Diretmidae.
diretmidae_branch_ids = []
tree.branch.each do |b|
	if b.id == diretmidae_branch_id
		diretmidae_branch_ids = b.progenyId
		break
	end
end

# Sort all dnds values into two arrays depending on whether they are within or outside of Diretmidae.
diretmid_dnds_string = ""
nondiretmid_dnds_string = ""
dnds_table_ids.size.times do |x|
	if diretmidae_branch_ids.include?(dnds_table_ids[x])
		dnds_table_value_strings[x].split(",").each {|i| diretmid_dnds_string << "#{i.to_f}\n"}
	else
		dnds_table_value_strings[x].split(",").each {|i| nondiretmid_dnds_string << "#{i.to_f}\n"}
	end
end

# Write the output tables.
diretmid_dnds_table_file = File.open(diretmid_dnds_table_file_name,"w")
diretmid_dnds_table_file.write(diretmid_dnds_string)
nondiretmid_dnds_table_file = File.open(nondiretmid_dnds_table_file_name,"w")
nondiretmid_dnds_table_file.write(nondiretmid_dnds_string)
