#!/bin/sed -f
# Getting commandline arguments
inputFile=$1 
age=$2

# Removing text within %
find $inputFile. -type f -mtime -$age ! -name *.sed -print0 | xargs -0 sed -ri 's/%.*%//'

# Replacing social security numbers
find  $inputFile. -type f -mtime -$age ! -name *.sed -print0 | xargs -0 sed -ri ':1 s/(^|[^-0-9])[0-9]{3}-[0-9]{2}-[0-9]{4}([^-0-9]|$)/\1%%%-%%-%%%%\2/g'

# Replacing phone number format ddd-ddd-dddd
find  $inputFile. -type f -mtime -$age ! -name *.sed -print0 | xargs -0 sed -ri ':1 s/(^|[^-0-9])[0-9]{3}-[0-9]{3}-[0-9]{4}([^-0-9]|$)/\1###-###-####\2/g'

# Replacing phone number format (ddd)sddd-dddd
find  $inputFile. -type f -mtime -$age ! -name *.sed -print0 | xargs -0 sed -i -r 's/\(([0-9]{3})\)[[:blank:]]+([0-9]{3})-([0-9]{4})/### ###-####/'

# Replacing phone number format ddd-dddd
find  $inputFile. -type f -mtime -$age ! -name *.sed -print0 | xargs -0 sed -ri ':1 s/(^|[^-0-9])[0-9]{3}-[0-9]{4}([^-0-9]|$)/\1###-####\2/g'


# Insert attention before * with an after blank space
find  $inputFile. -type f -mtime -$age ! -name *.sed -print0 | xargs -0 sed -ri '/^\*[[:blank:]]+/ s/./* ATTENTION *\n\n&/'

# Convert date formats
find  $inputFile. -type f -mtime -$age ! -name *.sed -print0 | xargs -0 sed -ri 's/([[:digit:]]{1,2})\/([[:digit:]]{1,2})\/([[:digit:]]{2,4})/\3-\2-\1/g'


