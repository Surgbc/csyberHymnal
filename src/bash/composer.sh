#!/bin/bash


echo "			CSOMPOSER V1"
echo "Author: Brian Onang'o					
Date: May 25, 2016"
echo "Requires:
	lilypond
	timidity
	lame"

#create path to lilypond directory
echo -e "please enter your username"
read  USERNAME
DIR_PATH="/home/$USERNAME/Documents/lilyponddata/hymnal"
cd $DIR_PATH

echo -e "please the song name"
read  HYMN

test=$(ls|grep $HYMN.midi)
if [ -z $test ];then
	echo "Fatal: no such song found";
	exit 10
fi

echo "working with song: "$HYMN

#soprano
MIDI_SOP_FILE=$HYMN.sop.midi
FILE_EXISTS=$(ls|grep $MIDI_SOP_FILE.ly)
if [ -z "$FILE_EXISTS" ];then
	echo "Fatal: soprano midi midi file missing";
	exit 10
fi
PDF_SOP_FILE=$HYMN.sop.pdf
FILE_EXISTS=$(ls|grep $PDF_SOP_FILE.ly)
if [ -z "$FILE_EXISTS" ];then
	echo "Fatal: soprano pdf midi file missing";
	exit 10
fi

#alto
MIDI_ALTO_FILE=$HYMN.alto.midi
FILE_EXISTS=$(ls|grep $MIDI_ALTO_FILE.ly)
if [ -z "$FILE_EXISTS" ];then
	echo "Fatal: alto midi midi file missing";
	exit 10
fi
PDF_ALTO_FILE=$HYMN.alto.pdf
FILE_EXISTS=$(ls|grep $PDF_ALTO_FILE.ly)
if [ -z "$FILE_EXISTS" ];then
	echo "Fatal: alto pdf midi file missing";
	exit 10
fi

#tenor
MIDI_TENOR_FILE=$HYMN.tenor.midi
FILE_EXISTS=$(ls|grep $MIDI_TENOR_FILE.ly)
if [ -z "$FILE_EXISTS" ];then
	echo "Fatal: tenor midi midi file missing";
	exit 10
fi
PDF_TENOR_FILE=$HYMN.tenor.pdf
FILE_EXISTS=$(ls|grep $PDF_TENOR_FILE.ly)
if [ -z "$FILE_EXISTS" ];then
	echo "Fatal: tenor pdf midi file missing";
	exit 10
fi

#bass
MIDI_BASS_FILE=$HYMN.bass.midi
FILE_EXISTS=$(ls|grep $MIDI_BASS_FILE.ly)
if [ -z "$FILE_EXISTS" ];then
	echo "Fatal: bass midi midi file missing";
	exit 10
fi
PDF_BASS_FILE=$HYMN.bass.pdf
FILE_EXISTS=$(ls|grep $PDF_BASS_FILE.ly)
if [ -z "$FILE_EXISTS" ];then
	echo "Fatal: bass pdf midi file missing";
	exit 10
fi

#hymnalsheet
MIDI_HYMN_FILE=$HYMN.midi
FILE_EXISTS=$(ls|grep $MIDI_HYMN_FILE.ly)
if [ -z "$FILE_EXISTS" ];then
	echo "Fatal: hymn midi midi file missing";
	exit 10
fi
PDF_HYMN_FILE=$HYMN.pdf
FILE_EXISTS=$(ls|grep $PDF_HYMN_FILE.ly)
if [ -z "$FILE_EXISTS" ];then
	echo "Fatal: hymn pdf midi file missing";
	exit 10
fi

#lilypond
echo "Generating scores in pdf and midi files"
echo "soprano midi file...."
lilypond $MIDI_SOP_FILE.ly
echo "soprano pdf file...."
lilypond $PDF_SOP_FILE.ly
echo "alto midi file...."
lilypond $MIDI_ALTO_FILE.ly
echo "alto pdf file...."
lilypond $PDF_ALTO_FILE.ly
echo "tenor midi file...."
lilypond $MIDI_TENOR_FILE.ly
echo "tenor pdf file...."
lilypond $PDF_TENOR_FILE.ly
echo "bass midi file...."
lilypond $MIDI_BASS_FILE.ly
echo "bass pdf file...."
lilypond $PDF_BASS_FILE.ly
echo "hymn midi file...."
lilypond $MIDI_HYMN_FILE.ly
echo "hymn pdf file...."
lilypond $PDF_HYMN_FILE.ly

#timidity
echo "Generating wav files"
echo "soprano wav file...."
timidity -Ow -o $MIDI_SOP_FILE.wav $MIDI_SOP_FILE.midi
echo "alto wav file...."
timidity -Ow -o $MIDI_ALTO_FILE.wav $MIDI_ALTO_FILE.midi
echo "tenor wav file...."
timidity -Ow -o $MIDI_TENOR_FILE.wav $MIDI_TENOR_FILE.midi
echo "bass wav file...."
timidity -Ow -o $MIDI_BASS_FILE.wav $MIDI_BASS_FILE.midi
echo "hymnal wav file...."
timidity -Ow -o $MIDI_HYMN_FILE.wav $MIDI_HYMN_FILE.midi

#lame
echo "Generating mp3 files"
echo "soprano mp3 file...."
lame $MIDI_SOP_FILE.wav $MIDI_SOP_FILE.mp3
echo "alto mp3 file...."
lame $MIDI_ALTO_FILE.wav $MIDI_ALTO_FILE.mp3
echo "tenor mp3 file...."
lame $MIDI_TENOR_FILE.wav $MIDI_TENOR_FILE.mp3
echo "bass mp3 file...."
lame $MIDI_BASS_FILE.wav $MIDI_BASS_FILE.mp3
echo "hymnal mp3 file...."
lame $MIDI_HYMN_FILE.wav $MIDI_HYMN_FILE.mp3
echo "Everything's done!"
