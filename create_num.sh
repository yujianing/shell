#!/bin/bash
i=1
while [ $i -lt 100000 ]
do
	echo $i
	let "i=i+1"
done 
