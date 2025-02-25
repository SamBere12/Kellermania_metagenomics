#!/b|in/bash
for site in metagenomas ; do ls batches_$site/ | while read line; do task=$(echo $line | cut -f2 -d'-'); echo $task; cp  bt-${site}-array.sh  bt-${site}-array-$task.sh; sed -i 's/$(printf %03d $SLURM_ARRAY_TASK_ID)/'$task'/g'  bt-${site}-array-$task.sh; bash bt-${site}-array-$task.sh; done; done #Hay que agregarlo al script
