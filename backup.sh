#!/bin/bash

# [TASK 1]
targetDirectory="/home/project/source"
destinationDirectory="/home/project/backup"

# [TASK 2]
echo "Target Directory: $targetDirectory"
echo "Destination Directory: $destinationDirectory"

# [TASK 3]
currentTS=$(date +%s)

# [TASK 4]
backupFileName="backup-$currentTS.tar.gz"

# [TASK 5]
origAbsPath=$(realpath "$targetDirectory")

# [TASK 6]
destAbsPath=$(realpath "$destinationDirectory")

# [TASK 7]
cd "$origAbsPath"

# [TASK 8]
yesterdayTS=$((currentTS - 24*60*60))

# [TASK 9]
declare -a toBackup
for file in $(ls)
do
    # [TASK 10]
    if (( $(date -r "$file" +%s) > yesterdayTS ))
    then
        # [TASK 11]
        toBackup+=("$file")
    fi
done

# [TASK 12]
tar -czvf "$backupFileName" "${toBackup[@]}"

# [TASK 13]
mv "$backupFileName" "$destAbsPath"
