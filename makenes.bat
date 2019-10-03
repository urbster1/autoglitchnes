@echo off
makechr.exe %~1.png -o %~1%%s.dat
rem check to make sure this was successful
if exist %~1palette.dat if exist %~1attribute.dat if exist %~1nametable.dat if exist %~1chr.dat goto:continue else goto:stop
:continue
python glitch.py %~1
truncate -c -s 4K %~1chr.dat
copy /b %~1chr.dat + %~1chr.dat + %~1chr.dat + %~1chr.dat + %~1chr.dat + %~1chr.dat + %~1chr.dat + %~1chr.dat %~1.chr
truncate -c -s 16 %~1palette.dat
rename %~1palette.dat %~1.pal
copy /b %~1nametable.dat + %~1attribute.dat %~1.dat
asm6 %~1.asm %~1.bin
copy /b %~1.bin+%~1.chr %~1.nes
del %~1.bin
goto:eof
:stop
echo Could not find files from makechr