#!/bin/bash

mkdir -p uploaded

TO_UPLOAD=$(ls Instapaper*)

for FILE in ${TO_UPLOAD} ${@:1} 
do
	echo "Uploading " ${FILE}
	curl --form file=@${FILE} http://10.11.99.1/upload		
	echo "*********"
	
	if [[ $? == 0 ]]
	then
		mv ${FILE} uploaded/${FILE}
	fi
done

echo "Finished Upload"
