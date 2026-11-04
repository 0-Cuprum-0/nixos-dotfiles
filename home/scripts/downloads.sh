#!/bin/bash

while true; do
    for file in ~/Downloads/*; do
        if [[ -d "$file" ]]; then
            continue
        fi
        if [[ $file == *.mp3 || $file == *.wav  || $file == *.flac ]]; 
	then
            mkdir -p ~/Downloads/music
            mv "$file" ~/Downloads/music/
        elif [[ $file == *.jpg || $file == *.png || $file == *.jpeg || $file == *.gif ]]; then
            mkdir -p ~/Downloads/images
            mv "$file" ~/Downloads/images/
        elif [[ $file == */A_K_C_V*.pdf ]]; then
            mkdir -p ~/Downloads/pdf/resumes
            mv "$file" ~/Downloads/pdf/resumes/
        elif [[ $file == *.mp4 || $file == *.mov ]]; then
            mkdir -p ~/Downloads/videos
            mv "$file" ~/Downloads/videos/
        elif [[ $file == *.pdf ]]; then
            mkdir -p ~/Downloads/pdf
            mv "$file" ~/Downloads/pdf/
        elif [[ $file == *.zip || $file == *.tar* || $file == *.deb ]]; then
            mkdir -p ~/Downloads/zips-and-debeans
            mv "$file" ~/Downloads/zips-and-debeans/
        elif [[ $file == *.csv || $file == *.ods || $file == *.xlsx || $file == *.txt || $file == *.docx || $file == *.doc ]]; then
            mkdir -p ~/Downloads/docs
            mv "$file" ~/Downloads/docs/

	elif [[ $file == *.pptx ]]; then
            mkdir -p ~/Downloads/presentations
            mv "$file" ~/Downloads/presentations/
	elif [[ $file == *.iso ]]; then
            mkdir -p ~/Downloads/isos
            mv "$file" ~/Downloads/isos/



      #  elif [[ $file == *.py || $file == *.ipynb || $file == *.db ]]; then
      #      mkdir -p ~/Downloads/python
      #      mv "$file" ~/Downloads/python/
        elif [[ $file != *.pdf || $file != *.mov || $file != *.mp4 || $file != *.mp3 || $file != *.wav || $file != *.zip || $file != *.tar* || $file != *.csv || $file != *.ods || $file != *.xlsx || $file != *.py || $file != *.ipynb || $file != *.deb || $file != *.txt || $file != *.docx || $file != *.doc || $file != *.jpg || $file != *.png || $file != *.jpeg || $file != *.gif ]]; then
            mkdir -p ~/Downloads/extra
            mv "$file" ~/Downloads/extra/
        fi
    done
    sleep 5
done
