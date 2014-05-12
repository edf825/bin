#!/bin/bash

BUILDDIR=~/build/fennec

# Stop Fennec if it's running.
adb shell am force-stop `cat $BUILDDIR/dist/fennec/package-name.txt`

screen_state=$(adb shell dumpsys power | sed -n 's/.*mPower\(State\|Request=screenState\)=\([0-9]\).*/\2/p')

echo Screen state = $screen_state

# If screen is off, turn it on.
if [ $screen_state = 0 ]; then
  echo Waking screen
  adb shell input keyevent 26
fi

# Start Fennec.
adb shell am start -n `cat $BUILDDIR/dist/fennec/package-name.txt`/.App $1
