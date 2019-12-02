#! /bin/bash

for file in ../Voters/*.pdf; do
  name=${file##*/}
  base=${name%.pdf}
  mkdir -p ../output2/$base
done

# gs -dBATCH -dNOPAUSE -sDEVICE=png16m -dGraphicsAlphaBits=4 -dTextAlphaBits=4 -r600 -sOutputFile="$1/png/page_%d.png" $2

# gs -q -dQUIET -dSAFER -dBATCH -dNOPAUSE -dNOPROMPT -dMaxBitmap=900000000 -dAlignToPixels=0 -dGridFitTT=2 -sDEVICE=pnggray -r1200 -dDownScaleFactor=4 -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -dUseTrimBox -dQFactor=1 -dColorConversionStrategy=/Gray -dProcessColorModel=/DeviceGray -sOutputFile="$1/page_%d.png" $2

# ls $1/png | grep -o '[0-9]\+' | parallel -j 4 "./process.sh $1 {}"

ls ../Voters/*.pdf | grep -o '[0-9]\+' | parallel -j 20 'gs -q -dQUIET -dSAFER -dBATCH -dNOPAUSE -dNOPROMPT -dMaxBitmap=900000000 -dAlignToPixels=0 -dGridFitTT=2 -sDEVICE=pnggray -r1200 -dDownScaleFactor=4 -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -dUseTrimBox -dQFactor=1 -dColorConversionStrategy=/Gray -dProcessColorModel=/DeviceGray -sOutputFile="../output2/{}/page_%d.png" ../Voters/{}.pdf'
# gs -q -dQUIET -dSAFER -dBATCH -dNOPAUSE -dNOPROMPT -dMaxBitmap=900000000 -dAlignToPixels=0 -dGridFitTT=2 -sDEVICE=pnggray -r1200 -dDownScaleFactor=4 -dTextAlphaBits=4 -dGraphicsAlphaBits=4 -dUseTrimBox -dQFactor=1 -dColorConversionStrategy=/Gray -dProcessColorModel=/DeviceGray -sOutputFile="$1/page_%d.png" {}