# m_matschiner Mon Jul 3 00:00:48 CEST 2017

# Make the output directories if they doesn't exist yet.
for i in 01 02 03
do
	mkdir -p ../res/beast2/nucleotides/replicates/r${i}/reconstructions
	mkdir -p ../res/beast2/indels/replicates/r${i}/reconstructions
done

# Copy xml input files to each output directory.
for i in ../res/beast2/nucleotides/replicates/r??
do
	cp ../data/xml/nucleotides.xml ${i}
	cp ../bin/beast.jar ${i}
	cp -r ../bin/BEASTLabs ${i}
	echo "java -jar -Dbeast.user.package.dir=\".\" -Xmx4g beast.jar -seed ${RANDOM} nucleotides.xml" > ${i}/start.sh
done
for i in ../res/beast2/indels/replicates/r??
do
	cp ../data/xml/indels.xml ${i}
	cp ../bin/beast.jar ${i}
	cp -r ../bin/MM ${i}
	cp -r ../bin/BEASTLabs ${i}
	echo "java -jar -Dbeast.user.package.dir=\".\" -Xmx1g beast.jar -seed ${RANDOM} indels.xml" > ${i}/start.sh
done
