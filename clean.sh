a=$(ls *.yaml)

for b in $a
do
	rm -r $(echo $b | sed 's/\.yaml//')
done

