module colors

import bool
import pair

data colors = red | green | blue | yellow | magenta | cyan

complement : colors -> colors
complement red = cyan
complement blue = yellow
complement green = magenta
complement yellow = blue
complement cyan = red
complement magenta = green

additive : colors -> bool
additive red = true
additive blue = true
additive green = true
additive _ = false

subtractive : colors -> bool
subtractive yellow = true
subtractive magenta = true
subtractive cyan = true
subtractive _ = false


complements : pair colors colors -> bool
complements (mkPair blue yellow) = true
complements (mkPair green magenta) = true
complements (mkPair red cyan) = true
complements (mkPair yellow blue) = true
complements (mkPair magenta green) = true
complements (mkPair cyan red) = true
complements (mkPair _ _) = false

mixink : pair colors colors -> colors
mixink (mkPair magenta cyan) = blue
mixink (mkPair cyan yellow) = green
mixink (mkPair magenta yellow) = red
mixink (mkPair cyan magenta) = blue
mixink (mkPair yellow cyan) = green
mixink (mkPair yellow magenta) = red












 
