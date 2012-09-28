wav="wav.wav"

samprate=8000

hmm=${POCKETSPHINX}/model/hmm/en_US/hub4wsj_sc_8k
jsgf=${GRAMMARS}/Action/jsgf/ActionEng.jsgf
dict=${GRAMMARS}/Action/dict/ActionEng.dict

#arecord --format=S16_LE --file-type wav --channels 1 --rate 16000 > $wav
#arecord --format=U8 --file-type wav --channels 1 --rate 8000 > $wav

pocketsphinx_continuous \
-fwdflat no \
-bestpath no \
-jsgf $jsgf \
-dict $dict \
-hmm $hmm \
-samprate $samprate \
-nfft 256 \
-infile $wav
