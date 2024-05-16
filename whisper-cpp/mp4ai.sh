# Set the mp4 files
mp4_files=$@

# Loop through each mp4 file
for mp4_file in $mp4_files; do
    mp4_file=${mp4_file//\"/}

    # Process the mp4 file
    mp4_file_name=${mp4_file##*/} # Extract the file name
    echo Processing: $mp4_file_name

    # extra audio
    # ffmpeg -i "$mp4_file" -vn -acodec copy "$mp4_file.aac"

    ffmpeg -i "$mp4_file" \
        -hide_banner \
        -vn \
        -loglevel error \
        -ar 16000 \
        -ac 1 \
        -c:a pcm_s16le \
        -y \
        "$mp4_file_name.wav"

    whisper-cpp -f "$mp4_file_name.wav" -p 4 -t 20 -otxt -osrt -l en -m ~/codes/_OpenAI_/ggml-base.en.bin

    # Rename the output file
    mv "$mp4_file_name.wav.srt" "$mp4_file_name.srt"
done
