#!/bin/bash
FILE=$(realname "$1")
PNG=${FILE}.png
python3 ~/makechr/makechr.py ${PNG} -o ${FILE}.dat
if [[ -f ${FILE}palette.dat && -f ${FILE}attribute.dat && -f ${FILE}nametable.dat && -f ${FILE}chr.dat ]]; then
  python3 glitch.py ${FILE}
  truncate -c -s 4k ${FILE}chr.dat
  cat ${FILE}chr.dat ${FILE}chr.dat ${FILE}chr.dat ${FILE}chr.dat ${FILE}chr.dat ${FILE}chr.dat ${FILE}chr.dat ${FILE}chr.dat > ${FILE}.chr
  truncate -c -s 16 ${FILE}palette.dat
  mv ${FILE}palette.dat ${FILE}.pal
  cat ${FILE}nametable.dat ${FILE}attribute.dat > ${FILE}.dat
  ./asm6 ${FILE}.asm
  cat ${FILE}.bin ${FILE}.chr > ${FILE}.nes
  rm ${FILE}.bin
else
  echo Could not find binary files from ${PNG}. Check to make sure makechr is working.
fi
