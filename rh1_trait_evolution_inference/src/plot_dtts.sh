# m_matschiner Tue Mar 5 14:43:11 CET 2019

# Prepare a temporary r script to plot all dtt trajectories for the different combinations of phased genes.
i=../res/geiger_model_predicted/dtt_001.txt
time_vector=`for n in 12 14 16 18 20; do head -n ${n} ${i} | tail -n 1 | tr -d "\n" | tr " " ","; done | rev | cut -c 2- | rev`
dtt_vector=`for n in 3 4 5 6 7 8 9; do head -n ${n} ${i} | tail -n 1 | sed "s/] /]/g" | cut -d "]" -f 2 | tr "\n" " " | tr " " ","; done | rev | cut -c 2- | rev`
echo "times <- c(${time_vector})" > tmp.r
echo "dtts <- c(${dtt_vector})" | sed "s/,)/)/g" >> tmp.r
echo "plot(times,dtts,type='l')" >> tmp.r
for j in `seq -w 2 256`
do
	i=../res/geiger_model_predicted/dtt_${j}.txt
	dtt_vector=`for n in 3 4 5 6 7 8 9; do head -n ${n} ${i} | tail -n 1 | sed "s/] /]/g" | cut -d "]" -f 2 | tr "\n" " " | tr " " ","; done | rev | cut -c 2- | rev`
	echo "dtts_${j} <- c(${dtt_vector})" | sed "s/,)/)/g" >> tmp.r
	echo "lines(times,dtts_${j})" >> tmp.r
done

# Execute the temporary r script.
rscript tmp.r

# Move the resulting pdf to the results directory.
mv Rplots.pdf ../res/geiger_model_predicted/dtts.pdf

# Clean up.
rm tmp.r