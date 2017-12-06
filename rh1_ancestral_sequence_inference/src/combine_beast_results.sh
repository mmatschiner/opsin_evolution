# m_matschiner Mon Jul 3 11:05:05 CEST 2017

# Combine log and trees files for the analyses with all constraints.
for type in indels nucleotides
do
	if [ ! -f ../res/beast2/${type}/combined/${type}.log ]
	then
		mkdir -p ../res/beast2/${type}/combined/reconstructions
		ls ../res/beast2/${type}/replicates/r0?/${type}.log > ../res/beast2/${type}/combined/logs.txt
		for i in ../res/beast2/${type}/replicates/r01/reconstructions/*.log
		do
			file_name=`basename $i`
			ls ../res/beast2/${type}/replicates/r0?/reconstructions/${file_name} > ../res/beast2/${type}/combined/reconstructions/logs_${file_name%.log}.txt
		done
		python3 logcombiner.py -n 2000 -b 10 ../res/beast2/${type}/combined/logs.txt ../res/beast2/${type}/combined/reconstructions.log
		for i in ../res/beast2/${type}/combined/reconstructions/logs_*.txt
		do
			branch_id=`basename ${i%.txt} | sed 's/logs_//g'`
			python3 logcombiner.py -n 1000 -b 10 ${i} ../res/beast2/${type}/combined/reconstructions/${branch_id}.log
		done
	fi
done