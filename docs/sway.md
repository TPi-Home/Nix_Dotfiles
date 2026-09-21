# Sway Setup

## Table of Contents
- [README](../README.md)
- [About](about.md)
- [ToDo](todo.md)
- [Sway](sway.md)

## Components of a Sway Session
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

## Wayland Scaling and X11 Support in Sway

### UWSM
---

* `services.dbus.implementation = "broker";` - uwsm default
* `uwsm` 
    * connects the Wayland compositor session to the existing user session infrastructure, which in this case is dbus and systemd 
    * propagates the graphical session environment

### Sway Scaling
---

Enabled with scaling set to 1 for maximum compatibility. This is important for highdpi users to take note of as all scaling is handled per app. Not every app has a way of handling this via a config file that can be declared with home-manager, meaning you may need to write a wrapper for it.

### Display Compatibility
---

I am having Kanshi handle my display management. To get your monitor's display information, run `swaymsg -t get_outputs.` You can then use the information printed to the terminal to manage `kanshi.nix.` I would like to eventually have a script automate this. Kanshi should handle every bit of display management, but I am not 100% sure of this yet.

#### Kanshi Example
---
```
outputs = [
    {
        criteria = "LG Electronics LG ULTRAGEAR 110NTRLAS678";
        mode = "3440x1440@160Hz";
        position = "0,0";
        scale = 1;
    }
];
```
---


### Steam
---

X11 apps can't really be scaled separately from Wayland, so the easiest way I have found to manage scaling with a high dpi display is by keeping the scaling in sway at 1 via `output * scale 1` in the Sway configuration file, then manually scaling the apps and desktop components to the degree I desire.

`xwayland-satellite` can be enabled for an extra x11/gaming compatibility option. Xwayland must first be disabled in the home manager's `sway.nix` file, then xwayland-satellite needs to be enabled in that same file and executed from the Sway config file. 



