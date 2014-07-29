#!/bin/bash

for device in `adb devices | grep 'device$' | sed -e 's/\s.*//'`
do
ANDROID_SERIAL="$device" $@&
done
