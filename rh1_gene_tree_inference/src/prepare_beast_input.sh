# m_matschiner Mon Jul 3 00:00:48 CEST 2017

# Make the output directories if they doesn't exist yet.
for i in 01 02 03
do
	mkdir -p ../res/beast2/all_constraints/replicates/r${i}
done

# Generate input files for beast2.
for i in ../res/beast2/all_constraints/replicates/r??
do
	ruby beauti.rb -id rod_opsin -n ../data/alignments -o ${i} -l 50000000 -c ../data/constraints/constraints.xml -bd -u -usd 1.0 -s
done