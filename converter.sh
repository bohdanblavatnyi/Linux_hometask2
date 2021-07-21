#!/bin/bash

touch ./output.yaml
column_names=()
function getheader {
	headers=$(head -n 1 ./input_file.csv)
	IFS='|'
	for column_name in $headers; do
	column_names+=( "$column_name" )
	done
}
getheader
IFS='|'
i=0
for line in `tail -n +2 ./input_file.csv`; do
	if (($i==${#column_names[@]})); then
		i=0
	fi
	line=$(echo $line|tr -d '\n')
	echo "${column_names[$i]}:$line" >> output.yaml
	((i++))
done
