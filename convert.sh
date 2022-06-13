#!/bin/bash

while read -r f; do

  echo "file: $f"
	docker run -v /mnt/backup/ad:/mnt/backup/ad jrottenberg/ffmpeg \
        -i "$f" "$f".mp4

done < <(find /mnt/backup/ad -not -name '*mp4' -not -name '*txt' -not -name '*jpg' -type f -mindepth 1 -maxdepth 1)
