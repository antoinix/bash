#! /bin/bash
function ExtractAudio(){
    for i in "$@"; do
        filename=${i%.*}
        ffmpeg -i $i -vn -c copy output_temp.m4a
        ffmpeg -i output_temp.m4a -f mp3 -acodec libmp3lame -y $filename.mp3
        rm -rf output_temp.m4a && rm -rf $i && rm -rf *.cmt.xml *.lrc
    done
}
