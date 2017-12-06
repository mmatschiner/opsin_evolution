# m_matschiner Sat Jul 1 23:52:17 CEST 2017

# Get the command-line arguments.
infile_name = ARGV[0]
outfile_name = ARGV[1]

# Read the infile.
inlines = File.open(infile_name).readlines
set_of_inlines = [inlines[0]]
outstring = ""
1.upto(inlines.size-1) do |x|
	if inlines[x][0..2] == "id:" or x == inlines.size-1
		set_of_inlines << inlines[x] if x == inlines.size-1
		id = ""
		set_of_inlines.each do |l|
			if l[0..2] == "id:" and id == ""
				id = l.split(":")[1].strip
			elsif l[0..2] == "id:" and id != ""
				puts "ERROR: Two ids found in set: #{id}"
				exit 1
			end
		end
		age = ""
		set_of_inlines.each do |l|
			if l[0..3] == "age:" and age == ""
				age = l.split(":")[1].strip
			elsif l[0..3] == "age:" and age != ""
				puts "ERROR: Two ages found in set: #{age}"
				exit 1
			end
		end
		age_hpd = ""
		set_of_inlines.each do |l|
			if l[0..7] == "age_hpd:" and age_hpd == ""
				age_hpd = l.split(":")[1].strip
			elsif l[0..7] == "age_hpd:" and age_hpd != ""
				puts "ERROR: Two age_hpds found in set: #{age_hpd}"
				exit 1
			end
		end
		species = []
		in_species = false
		set_of_inlines.each do |l|
			if l.strip == "="
				in_species = true
			elsif in_species and l.strip != ""
				species << l.strip
			end
		end
		outstring << "                <distribution id=\"#{id}.prior\" spec=\"beast.math.distributions.MRCAPrior\" monophyletic=\"true\" tree=\"@tree.t:Species\">\n"
		outstring << "                    <taxonset id=\"#{id}\" spec=\"TaxonSet\">\n"
		species.each do |s|
			outstring << "                        <taxon idref=\"#{s}\"/>\n"
		end
		outstring << "                    </taxonset>\n"
		unless age[0..1] == "NA"
			# Get the distribution parameters specified in the input file.
			specified_mean = age.to_f
			specified_lower = age_hpd.split("-")[0].to_f
			specified_upper = age_hpd.split("-")[1].to_f
			if specified_mean < specified_lower or specified_mean > specified_upper
				puts "ERROR: The mean age does not lie within the HPD interval!"
				exit 1
			end
			# # Calculate parameters of a fitted lognormal distribution.
			# best_offset = 0
			# best_stdev = 0
			# best_rmsd = 10000000000
			# 0.upto((10*specified_mean).floor) do |current_tenfold_offset|
			# 	current_offset = current_tenfold_offset/10.0
			# 	0.upto(200) do |current_hundredfold_stdev|
			# 		current_stdev = current_hundredfold_stdev/100.0
			# 		current_lower = current_offset + Math.exp(Math.log(specified_mean-current_offset)-2*current_stdev)
			# 		current_upper = current_offset + Math.exp(Math.log(specified_mean-current_offset)+2*current_stdev)
			# 		current_rmsd = Math.sqrt((specified_lower-current_lower)**2+(specified_upper-current_upper)**2)
			# 		if current_rmsd < best_rmsd
			# 			best_offset = current_offset
			# 			best_stdev = current_stdev
			# 			best_rmsd = current_rmsd
			# 		end
			# 	end
			# end
			# lognormal_prior_mean = (specified_mean-best_offset).round(5)
			# lognormal_prior_offset = best_offset.round(5)
			# lognormal_prior_standard_deviation = best_stdev.round(5)
			# lognormal_prior_rmsd = best_rmsd
			# # Calculate parameters of a fitted normal distribution.
			# best_stdev = 0
			# best_rmsd = 10000000000
			# 0.upto(2000) do |current_tenfold_stdev|
			# 	current_stdev = current_tenfold_stdev/10.0
			# 	current_lower = specified_mean-2*current_stdev
			# 	current_upper = specified_mean+2*current_stdev
			# 	current_rmsd = Math.sqrt((specified_lower-current_lower)**2+(specified_upper-current_upper)**2)
			# 	if current_rmsd < best_rmsd
			# 		best_stdev = current_stdev
			# 		best_rmsd = current_rmsd
			# 	end
			# end
			# normal_prior_mean = specified_mean.round(5)
			# normal_prior_stdev = best_stdev.round(5)
			# normal_prior_rmsd = best_rmsd
			# # Use the distribution with the better fit as an calibration density.
			# if lognormal_prior_rmsd < normal_prior_rmsd
			# 	outstring << "                    <LogNormal name=\"distr\" meanInRealSpace=\"true\" offset=\"#{lognormal_prior_offset}\">\n"
			# 	outstring << "                        <parameter estimate=\"false\" name=\"M\">#{lognormal_prior_mean}</parameter>\n"
			# 	outstring << "                        <parameter estimate=\"false\" lower=\"0.0\" name=\"S\" upper=\"5.0\">#{lognormal_prior_standard_deviation}</parameter>\n"
			# 	outstring << "                    </LogNormal>\n"
			# 	puts "#{id}\tlognormal\t#{lognormal_prior_rmsd}"
			# else
			# 	outstring << "                    <Normal name=\"distr\">\n"
			# 	outstring << "                        <parameter estimate=\"false\" name=\"mean\">#{normal_prior_mean}</parameter>\n"
			# 	outstring << "                        <parameter estimate=\"false\" name=\"sigma\">#{normal_prior_stdev}</parameter>\n"
			# 	outstring << "                    </Normal>\n"
			# 	puts "#{id}\tnormal\t#{normal_prior_rmsd}"
			# end
			outstring << "                    <Normal name=\"distr\">\n"
			outstring << "                        <parameter estimate=\"false\" name=\"mean\">#{specified_mean}</parameter>\n"
			outstring << "                        <parameter estimate=\"false\" name=\"sigma\">0.1</parameter>\n"
			outstring << "                    </Normal>\n"
		end
		outstring << "                </distribution>\n"
		set_of_inlines = [inlines[x]]
	else
		set_of_inlines << inlines[x]
	end
end

# Write the output to file.
outfile = File.open(outfile_name,"w")
outfile.write(outstring)
