#!/bin/bash

cities=( mumbai hyderabad gujrat delhi kolkatta )

echo "Total elements in arrays: ${#cities[@]}"

for x in ${cities[@]}
do
echo $x
done



