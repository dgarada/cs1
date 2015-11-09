module bangers

import banger
import list
import bool

||| A record of this type represents a beat, if its a banger, and its tempo.

french: Bangers
french = mkbeatRow "French" true 78

amor: Bangers
amor = mkbeatRow "Amor" true 62

lucy: Bangers
lucy = mkbeatRow "Lucy" false 81

fore: Bangers
fore = mkbeatRow "Fore" true 81

-- a list of bangers

songs: list Bangers
songs = french::
        amor::
        lucy::
        fore::
        nil
