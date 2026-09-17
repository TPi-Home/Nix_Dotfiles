# SWAY TODO

## uwsm
cage or something full screen
home-manager system ctl mgmt
vscode nf
swayfx
sway notifications 
app launcher
vscode starting firefox from wofi
test logout 
configure wayland in a different module than wm/de/dm
file picker scaling needs fixed

THIS IS WHY I DO NOT RUSH TO A WINDOW MANAGER OVER A FULL DE

wayland issues:
session would break after logging back to display manager
opening firefox would do nothing. i kept trying to open it, nothing happened. i accidentally locked the screen to fall back to tty and when i logged back in, 20 firefox instances opened.

perhaps env variables not carried over well from gnome setup
wofi- i will come back to this
    * swapping with rofi to debug, rofi has wayland support anyway
    * was opening random apps when apps hung up

## Sway
* Wayland session
* XWayland
* D-Bus session
    * sync environment on startup
* systemd --user
    * Receives Sway environment
* XDG: 
    * desktop portals
    * MIME/default applications
    * config/data/cache dirs
* GTK
* Qt

## Important Environment Variables

```text

XDG_SESSION_TYPE
XDG_CURRENT_DESKTOP
XDG_SESSION_DESKTOP

WAYLAND_DISPLAY
DISPLAY

XDG_RUNTIME_DIR

DBUS_SESSION_BUS_ADDRESS

PATH

XDG_CONFIG_HOME
XDG_DATA_HOME
XDG_CACHE_HOME

```
