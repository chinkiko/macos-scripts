# Set the directory containing your MP3 files
mp3_dir=$1
mp3_dir=${mp3_dir//\"/}

# Loop through each MP3 file in the directory
for i in "$mp3_dir"/*.mp3; do
    mp3_file=${i##*/} # Extract the file name
    mp3_file="$mp3_dir/$mp3_file"
    echo Processing: $mp3_file

    ffmpeg -i "$mp3_file" \
        -hide_banner \
        -vn \
        -loglevel error \
        -ar 16000 \
        -ac 1 \
        -c:a pcm_s16le \
        -y \
        "$mp3_file.wav"

    whisper-cpp -f "$mp3_file.wav" -t 20 -otxt -osrt -m ~/codes/whisper.cpp/models/ggml-base.en.bin
done

