#!/usr/bin/env bash
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run /usr/lib/kactivitymanagerd
run /usr/bin/kglobalaccel5
run nm-applet
# run parcellite
run blueman-applet
run xfce4-power-manager
# run picom --experimental-backend --config $HOME/.config/awesome/picom.conf
picom 
spotifyd --no-daemon