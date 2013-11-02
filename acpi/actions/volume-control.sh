#!/bin/bash

VolumeUp () {
   amixer set Master 5%+
}

VolumeDown () {
   amixer set Master 5%-
}

VolumeMuteToggle () {
   amixer set Master toggle
}

case "$1" in
   "up") VolumeUp ;;
   "down") VolumeDown ;;
   "muteToggle") VolumeMuteToggle ;;
   *) echo "ERROR controlling volume, up, down or muteToggle must be specified" ;;
esac
