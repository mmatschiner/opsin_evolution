# m_matschiner Mon Jul 3 11:05:05 CEST 2017

# Combine log and trees files for the analyses with all constraints.
if [ ! -f ../res/beast2/all_constraints/combined/rod_opsin.log ]
then
	mkdir -p ../res/beast2/all_constraints/combined
	ls ../res/beast2/all_constraints/replicates/r0?/rod_opsin.log > ../res/beast2/all_constraints/combined/logs.txt
	ls ../res/beast2/all_constraints/replicates/r0?/rod_opsin.trees > ../res/beast2/all_constraints/combined/trees.txt
	python3 ~/Software/Python/logcombiner.py -n 2000 -b 10 ../res/beast2/all_constraints/combined/logs.txt ../res/beast2/all_constraints/combined/rod_opsin.logs
	python3 ~/Software/Python/logcombiner.py -n 2000 -b 10 ../res/beast2/all_constraints/combined/trees.txt ../res/beast2/all_constraints/combined/rod_opsin.trees
fi
