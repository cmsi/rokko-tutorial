#!/bin/sh

DATE=`grep '^\\\\date{' style/tutorial.sty | sed 's/\\\\date{//g' | sed 's/}//g' | sed 's/-//g'`

if test -z "$DATE"; then
  echo "VERSION = NONE"
  BASE="rokko-tutorial"

else  
  echo "VERSION = $DATE"
  BASE="rokko-tutorial-$DATE"
fi

make

cp -fp master.pdf $BASE.pdf
cp -fp master-wide.pdf $BASE-wide.pdf
