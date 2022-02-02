#!/bin/sed -f
# Getting commandline arguments
# Removing lines starting with % and editing both the  // and # comments

sed -e 's/.*\#\( \)\{0,\}/\/\/ /' -e '/^%/d' -e 's/.*\/\/\( \)\{0,\}/\/\/ /' file1.php >  file1Clean.php