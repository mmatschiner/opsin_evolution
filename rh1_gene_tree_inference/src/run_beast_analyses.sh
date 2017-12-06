# m_matschiner Mon Jul 3 00:11:32 CEST 2017

# Memorize the home directory.
home=`pwd`

# Go to each replicate directory and run beast2 in it.
for i in ../res/beast2/all_constraints/replicates/r??
do
	cd ${i}
	seed=`cat start.slurm | grep java | cut -d " " -f 8`
	java -jar -Xmx4g beast.jar -seed ${seed} rod_opsin.xml
	cd ${home}
done