## Michael Matschiner 2015-03-06.

for i in ${1}*
do
    ruby beauti.rb -id `basename $i` -n $i -u -s -o $i -c ../data/constraints/root_constraints.xml
done
