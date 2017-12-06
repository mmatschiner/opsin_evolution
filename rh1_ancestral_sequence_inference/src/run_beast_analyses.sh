# m_matschiner Mon Jul 3 00:04:23 CEST 2017

# Memorize the home directory.
home=`pwd`

# Go to each replicate directory and run beast2 in it.
for i in ../res/beast2/{nucleotides,indels}/replicates/r??
do
	cd ${i}
	bash start.sh
	cd ${home}
done