# Sway Setup

## Table of Contents
- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Sway](sway.md)

## How Sway Works
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

## UWSM
* `services.dbus.implementation = "broker";` - uwsm default
* `uwsm` 
    * connects the Wayland compositor session to the existing user session infrastructure, which in this case is dbus and systemd 
    * propagates the graphical session environment


