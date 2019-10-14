# autoglitchnes
A few scripts to automate making custom glitchNES ROMs

# Requirements
* [makechr](https://github.com/dustmop/makechr/releases)
* Python 3
* Windows (sorry... most of this is cross-platform so I will accept pull requests)
* [GNU CoreUtils](http://gnuwin32.sourceforge.net/packages/coreutils.htm) (not needed on Linux/Cygwin)

# How to use
Install Python and GNU CoreUtils and make sure they are in PATH so they can be found when you can run them from the command line.

Follow [this tutorial](https://www.youtube.com/watch?v=wRyeE6wEx-o&lc) to generate an indexed 256x240 PNG that fulfills the basic restrictions for use in makechr. In general this means that only 4 colors can be used in each 16x16 pixel area (tile), and you are restricted to 4 palettes of 4 colors including 1 color common to all palettes (13 colors maximum). I've provided the NES palette that makechr uses in GIMP format here: https://defensemech.com/nes.gpl. Additionally, you are limited to 256 unique 8x8 tiles.

Once you've generated your PNG image and you can verify that makechr can process it without errors in the GUI, place it in the same folder as makechr, asm6, glitch.py, and makenes.bat. Then open a command line and run `makenes.bat [image]` where "image" is the filename without the .png extension. This will generate your NES ROM assuming all went well.

# Controls (from glitchNES README)
| Controller 1 | |
|--------------|-|
|Select | toggle tile writing (auto-glitch)|
|Start | bankswitch|
|Up, Down, Left, Right | toggle movement in that direction|
|B | slows down everything (kind of)|
|A | speeds up everything (pretty much)|

| Controller 2 | |
|--------------|-|
|Select | toggle background color cycling|
|Start | PAUSE (when held down)|
|Left, Right | not used|
|Up, Down | change screens and banks|
|B | tap tempo to control auto-glitch|
|A | turns off tile writing (auto-glitch) / clears tap tempo|

# Thanks
Thanks to NO CARRIER for [glitchNES](https://github.com/no-carrier/glitchNES-0.2)!!! Thanks to dustmop for makechr!!!
