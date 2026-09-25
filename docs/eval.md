evaluation warning: ‘xfce.thunar-archive-plugin’ was moved to top-level. Please use ‘pkgs.thunar-archive-plugin’ directly
evaluation warning: ‘xfce.thunar-volman’ was moved to top-level. Please use ‘pkgs.thunar-volman’ directly

for debugging tty being written over in tuigreet after violent close of nm applet:

❯ journalctl --user --since "10 minute ago"
Sep 25 15:04:57 nixos systemd[4463]: Started kitty child process: 5317 launched by: 5308.
Sep 25 15:04:59 nixos systemd[4463]: Started app-code-5436.scope.
Sep 25 15:08:08 nixos systemd[4463]: Created slice User Background Tasks Slice.
Sep 25 15:08:08 nixos systemd[4463]: Starting Cleanup of User's Temporary Files and Directories...
Sep 25 15:08:08 nixos systemd[4463]: Finished Cleanup of User's Temporary Files and Directories.
Sep 25 15:14:12 nixos systemd[4463]: Started kitty child process: 6051 launched by: 6042.

tyler  ~  ♥ 15:14  

❯ systemctl --user cat nm-applet.service
  systemctl --user cat blueman-applet.service
# /etc/systemd/user/nm-applet.service -> /nix/store/6frrk2dl602lwkc14gm9nz6nwacp25cz-unit-nm-applet.service/nm-applet.service
[Unit]
After=graphical-session.target
Description=Network manager applet
PartOf=graphical-session.target

[Service]
Environment="LOCALE_ARCHIVE=/nix/store/hvznc01w42na6hiad627833ci4dhjvnc-glibc-locales-2.42-84/lib/locale/locale-archive"
Environment="PATH=/nix/store/xjl7p8dvyk2j53kqf7f43kdj4ypbxz7g-coreutils-9.11/bin:/nix/store/i9wgqa0l88aprvpwfaq5hkfa6pklhlv0-findu>
Environment="TZDIR=/nix/store/fh8svr4ds87z84iarfnxrlfpjlbmc816-tzdata-2026c/share/zoneinfo"
ExecStart=/nix/store/f73rs7f8jqdy6wywl62dd0wpm65xgi1i-network-manager-applet-1.36.0/bin/nm-applet --indicator

[Install]
WantedBy=graphical-session.target
# /run/current-system/sw/share/systemd/user/blueman-applet.service -> /nix/store/xc8zax56p7gv6ai6vm11s0j65shmk62j-blueman-2.4.6/sh>
[Unit]
Description=Bluetooth management applet

[Service]
Type=dbus
BusName=org.blueman.Applet
ExecStart=/nix/store/xc8zax56p7gv6ai6vm11s0j65shmk62j-blueman-2.4.6/bin/blueman-applet

tyler  ~  ♥ 15:14  

❯ systemctl --user show nm-applet.service -p PartOf -p BindsTo -p After -p Before
  systemctl --user show blueman-applet.service -p PartOf -p BindsTo -p After -p Before
BindsTo=
PartOf=graphical-session.target
Before=shutdown.target
After=graphical-session.target basic.target -.mount app.slice
BindsTo=
PartOf=
Before=shutdown.target
After=-.mount app.slice basic.target dbus.socket