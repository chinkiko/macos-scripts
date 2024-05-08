# command line parameters
INPUT=$1

# convert media to wav
ffmpeg -i $INPUT -ar 16000 -c:a pcm_s16le "$INPUT.wav"

# ask for target language
echo "Enter the target language (zh, ja, en, es default is en):"
read -p "Language: " LANGUAGE
LANGUAGE=${LANGUAGE:-en}

# ask for processors to use
echo "Enter the number of processors to use (1, 2, 3, 4, default is 2):"
read -p "Processors: " PROCESSORS
PROCESSORS=${PROCESSORS:-2}

# ask for models to use
echo "Enter the model to use (ggml-small.bin, ggml-base.en.bin, ggml-small.en.bin, default is ggml-small.bin):"
read -p "Model: " MODEL
MODEL=${MODEL:-ggml-small.bin}

# run whisper-cpp with specified parameters 
# whisper-cpp -otxt -osrt -m ~/codes/_OpenAI_/$MODEL -p $PROCESSORS -t 4 -l $LANGUAGE -f "$INPUT.wav"

# no GPU; ggml-metal error
whisper-cpp -otxt -osrt -m ~/codes/_OpenAI_/$MODEL -p $PROCESSORS -t 4 -ng -l $LANGUAGE -f "$INPUT.wav"
