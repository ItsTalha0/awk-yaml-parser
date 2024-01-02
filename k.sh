a=$(ls *.yaml)

for b in $a
do
	mkdir $(echo $b | sed 's/\.yaml//')
	awk -f ovr.awk $b;
done

