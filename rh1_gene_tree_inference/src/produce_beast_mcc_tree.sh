# m_matschiner Mon Jul 3 11:10:51 CEST 2017

# Generate the MCC tree for the analyses with all constraints.
if [ ! -f ../res/beast2/all_constraints/combined/rod_opsin.tre ]
then
	java -jar ../bin/treeannotator.jar -burnin 0 -heights mean ../res/beast2/all_constraints/combined/rod_opsin.trees ../res/beast2/all_constraints/combined/rod_opsin.tre
fi
