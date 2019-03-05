# m_matschiner Wed Jul  5 13:11:03 CEST 2017

# Make the output directory if it doesn't exist yet.
mkdir -p ../res/geiger
mkdir -p ../res/geiger_model_predicted

# Run a disparity-through-time analysis with geiger.
#rscript run_dtt_on_tree.r ../res/trees/rod_opsin_pruned.tre ../data/tables/wavelengths.txt > ../res/geiger/dtt.txt

# Move the output plot to the results directory.
#mv Rplots.pdf ../res/geiger/dtt.pdf

# Run disparity-through-time analyses with geiger for all possible combinations of wavelengths at phased genes.
for i in `seq -w 256`
do
	ruby make_tmp_wavelength_table.rb ../data/tables/wavelengths_model_predicted.txt ${i} tmp_${i}.txt
	rscript run_dtt_on_tree.r ../res/trees/rod_opsin_pruned_model_predicted.tre tmp_${i}.txt > ../res/geiger_model_predicted/dtt_${i}.txt
	mv Rplots.pdf ../res/geiger_model_predicted/dtt_${i}.pdf
	rm -f tmp_${i}.txt
done

# Get the range of mdi values resulting from the disparity-through-time analyses for all possible combinations of wavelengths at phased genes.
lower=`for i in ../res/geiger_model_predicted/*.txt; do tail -n 2 ${i} | head -n 1; done | sort -n | head -n 1`
upper=`for i in ../res/geiger_model_predicted/*.txt; do tail -n 2 ${i} | head -n 1; done | sort -n | tail -n 1`
echo "MDI values range from ${lower} to ${upper}."