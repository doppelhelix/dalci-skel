#
# ~/.zlogout
#
if [ ! "$TERM" = "xterm-kitty" ]; then
  tput reset
else
 return
fi

