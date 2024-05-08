# Set the directory containing your mp4 files
mp4_dir=$1
mp4_dir=${mp4_dir//\"/}

# Loop through each mp4 file in the directory
for i in "$mp4_dir"/*.mp4; do
    mp4_file=${i##*/} # Extract the file name
    mp4_file="$mp4_dir/$mp4_file"
    echo Processing: $mp4_file

    # extra audio
    ffmpeg -i "$mp4_file" -vn -acodec copy "$mp4_file.aac"

    ffmpeg -i "$mp4_file" \
        -hide_banner \
        -vn \
        -loglevel error \
        -ar 16000 \
        -ac 1 \
        -c:a pcm_s16le \
        -y \
        "$mp4_file.wav"

    whisper-cpp -f "$mp4_file.wav" -t 20 -otxt -osrt -m ~/codes/whisper.cpp/models/ggml-base.en.bin
done


for f in *.mp4.wav.srt; do
    mv "$f" "${f//.wav/}"
done
