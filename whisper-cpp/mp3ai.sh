# Set the mp3 files
mp3_files=$@

# Loop through each mp3 file
for mp3_file in $mp3_files; do
    mp3_file=${mp3_file//\"/}

    # Process the mp3 file
    mp3_file_name=${mp3_file##*/} # Extract the file name
    echo Processing: $mp3_file_name

    # extra audio
    # ffmpeg -i "$mp3_file" -vn -acodec copy "$mp3_file.aac"

    ffmpeg -i "$mp3_file" \
        -hide_banner \
        -vn \
        -loglevel error \
        -ar 16000 \
        -ac 1 \
        -c:a pcm_s16le \
        -y \
        "$mp3_file_name.wav"

    whisper-cpp -f "$mp3_file_name.wav" -p 4 -t 20 -otxt -osrt -l en -m ~/codes/_OpenAI_/ggml-base.en.bin

    # Rename the output file
    mv "$mp3_file_name.wav.srt" "$mp3_file_name.srt"
done
