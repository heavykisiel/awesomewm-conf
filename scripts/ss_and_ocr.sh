#!/bin/bash

mkdir /tmp/screenshot_trash
scrot -s /tmp/screenshot_trash/ss.png
tesseract /tmp/screenshot_trash/ss.png /tmp/screenshot_trash/text
alacritty --hold -e cat /tmp/screenshot_trash/text.txt
rm /tmp/screenshot_trash/ss.png
