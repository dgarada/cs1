module Rainbow

data Rainbow = red | orange | yellow | green | blue | indigo | violet

nextColor : Rainbow -> Rainbow
nextColor red = orange
nextColor orange = yellow
nextColor yellow = green
nextColor green = blue
nextColor blue = indigo
nextColor indigo = violet
nextColor violet = red
