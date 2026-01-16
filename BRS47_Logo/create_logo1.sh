#!/bin/bash

GSUSAFILE="great_seal_reverse.svg"
GSUSAFILEOBVERSE="great_seal_obverse.svg"

# create a new 1280×640 SVG canvas (GitHub recommended size)


# centered
function graphics_work_do {
    
  ./magick -size 1280x640 xc:none \
     \( -density 300 "$GSUSAFILE"        -transparent white -resize x580 \) \
        -gravity center -geometry -320+0 -composite \
     \( -density 300 "$GSUSAFILEOBVERSE" -transparent white -resize x580 \) \
        -gravity center -geometry +320+0 -composite \
    logo_sized.png

}


# touching shifted to left
function graphics_work_do_one {
    
./magick -size 1280x640 xc:none \
  \( -density 300 "$GSUSAFILE"        -transparent white -resize x580 \) \
  -gravity center -geometry -344+0 -composite \
  \( -density 300 "$GSUSAFILEOBVERSE" -transparent white -resize x580 \) \
  -gravity center -geometry +229+0 -composite \
  logo_sized.png

}


function graphics_work_do_two {
    
./magick -size 1280x640 xc:none \
  \( -density 300 "$GSUSAFILE"        -transparent white -resize x580 \) \
  -gravity center -geometry -344-27 -composite \
  \( -density 300 "$GSUSAFILEOBVERSE" -transparent white -resize x580 \) \
  -gravity center -geometry +234-27 -composite \
  \
  -font "Ubuntu-Mono-Bold" -pointsize 28 \
  -fill "#B54700" -stroke "#B54700" -strokewidth 2 \
  -gravity south -annotate -61-10 "#BRS47" \
  \
  -pointsize 15 \
  -gravity east -annotate 270x270+60-280 "#BrainRotSociety47" \
  \
  logo_sized.png

}




if [ -f "$GSUSAFILEOBVERSE" ]; then
  echo "The file '$GSUSAFILEOBVERSE' exists and is a regular file."
else

  wget -O $GSUSAFILEOBVERSE \
  https://upload.wikimedia.org/wikipedia/commons/5/5c/Great_Seal_of_the_United_States_%28obverse%29.svg
  
  echo "Please re-run this bash script if the download worked..."

  exit 0
fi

if [ -f "$GSUSAFILE" ]; then
  echo "The file '$GSUSAFILE' exists and is a regular file."
  graphics_work_do_two
else

  wget -O $GSUSAFILE \
  https://upload.wikimedia.org/wikipedia/commons/4/45/Great_Seal_of_the_United_States_%28reverse%29.svg
  
  echo "Please re-run this bash script if the download worked..."
fi

