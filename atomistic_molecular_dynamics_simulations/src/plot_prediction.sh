# m_matschiner Thu Mar 7 16:54:05 CET 2019

# Make the plot directory.
mkdir -p ../res/plots

# Plot the atomistic modeling prediction.
rscript Rhodopsins_Final_DB.R

# Move plot to results directory.
mv Rplots.pdf ../res/plots