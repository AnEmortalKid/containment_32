#!/bin/sh

# from foo/x.png -> x
get_name(){
  local filename=$(basename -- "$1")
  local extension="${filename##*.}"
  filename="${filename%.*}"
  echo $filename
}

# create if not exist
mkdir -p out

# area for our step images
mkdir -p scratch

# get random images
BACKGROUND="backgrounds/$(ls backgrounds | shuf -n 1)"
POKEMON="pokemon/$(ls pokemon | shuf -n 1)"
BG_NAME=$(get_name $BACKGROUND)
POKE_NAME=$(get_name $POKEMON)
IMG_NAME="${POKE_NAME}_goes_to_${BG_NAME}.png"

# Compute average color to use for the frame
COLOR_SRC=$(shuf -e $BACKGROUND $POKEMON -n 1)
AVG_COLOR=$(magick convert $COLOR_SRC -resize 1x1\! -format "%[fx:int(255*r+.5)],%[fx:int(255*g+.5)],%[fx:int(255*b+.5)]" info:-)

# resize the background
magick $BACKGROUND -resize "50%" "scratch/$BG_NAME.png"

# place the pokemon in the desired position
POSITION=$(shuf -e center northeast northwest southeast southwest east west north south -n 1)
magick composite -gravity $POSITION $POKEMON "scratch/$BG_NAME.png" "scratch/$IMG_NAME"

# create colored frame around it
magick convert "scratch/$IMG_NAME" -alpha set -mattecolor "rgb($AVG_COLOR)" -bordercolor none -frame 18x18+3+2 out/$IMG_NAME

echo "$POKE_NAME goes to $BG_NAME => out/$IMG_NAME"