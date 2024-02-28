## AwesomeWM-conf preview

![2024-02-28_1922x1080](https://github.com/heavykisiel/awesomewm-conf/assets/61516447/31c7ff58-84d3-4e28-8b2f-d2e154f2cf10)

This is a configuration modularised rc.lua config for the awesomewm, which provides a powerful set of tools for managing windows and workspaces. This configuration file is tailored to my personal preferences, but feel free to modify it to suit your needs.
Here are the main features of this configuration:

* Taskbar and tagbar are together on left side.
* Colorful widgets with resources usage info and icons.
* Additional keyboard shortcuts: for screenshots and ocr screenshots, rofi app launcher.
* Lua popup debugger as a tool for modification.
* Everything except signals for now is putted into modules that helps navigation.

If you want this window manager running you have to install awesomewm through your package manager and if its already running you need to clone repo into `~/.config/awesome` and hit `modkey4 + ctrl + r` to reaload configuration.
To make work screenshot apps and launcher as intended I recommend you to install this dependencies:
* rofi
* scrot
* nitrogen
* picom
