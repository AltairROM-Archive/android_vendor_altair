#!/bin/bash

WIDTH="$1"
HEIGHT="$2"
HALF_RES="$3"
OUT="$ANDROID_PRODUCT_OUT/obj/BOOTANIMATION"

if [ "$HEIGHT" -lt "$WIDTH" ]; then
    IMAGEWIDTH="$HEIGHT"
else
    IMAGEWIDTH="$WIDTH"
fi

IMAGESCALEWIDTH="$IMAGEWIDTH"
IMAGESCALEHEIGHT="$IMAGESCALEWIDTH"

if [ "$HALF_RES" = "true" ]; then
    IMAGEWIDTH=$(expr $IMAGEWIDTH / 2)
fi

IMAGEHEIGHT="$IMAGEWIDTH"

RESOLUTION=""$IMAGEWIDTH"x"$IMAGEHEIGHT""

for part_cnt in 0 1 2 3 4
do
    mkdir -p $ANDROID_PRODUCT_OUT/obj/BOOTANIMATION/bootanimation/part$part_cnt
done
tar xfp "vendor/altair/bootanimation/bootanimation.tar" --to-command="convert - -resize '$RESOLUTION' \"png8:$OUT/bootanimation/\$TAR_FILENAME\""
tar xfp "vendor/altair/bootanimation/bootanimation.tar" --to-command="convert - -resize '$RESOLUTION' -colors 250 \"png8:$OUT/bootanimation/\$TAR_FILENAME\""

# Create desc.txt
echo "$IMAGESCALEWIDTH $IMAGESCALEHEIGHT" 15 > "$OUT/bootanimation/desc.txt"
cat "vendor/altair/bootanimation/desc.txt" >> "$OUT/bootanimation/desc.txt"

# Create bootanimation.zip
cd "$OUT/bootanimation"

zip -qr0 "$OUT/bootanimation.zip" .
