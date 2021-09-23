#! /bin/bash

action=$(yad --width 300 --entry --title "System Logout" \
  --button="Ok" --button="Cancel" \
  --text "What to do?" \
  --entry-text \
  "Power Off" "Reboot" "Logout" \
)

return=$?

if [[ $return -eq 1 ]] ; then
  exit 0
fi

case $action in
  Power*) cmd="systemctl poweroff" ;;
  Reboot*) cmd="systemctl reboot" ;;
  Logout*) cmd="i3-msg exit"
esac

eval exec $cmd
