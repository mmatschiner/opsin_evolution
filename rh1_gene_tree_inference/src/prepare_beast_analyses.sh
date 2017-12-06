# m_matschiner Mon Jul 3 00:07:20 CEST 2017

# Copy the beast2 executable to all replicate directories.
for i in ../res/beast2/all_constraints/replicates/r??
do
	cp ../bin/beast.jar ${i}
	cp -r ../bin/BEASTLabs ${i}
	cp -r ../bin/bModelTest ${i}
done
