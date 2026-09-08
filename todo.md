# To-Do List
## Important:
Set nix shell to unstable:
$ nix-shell -p nix -I nixpkgs=channel:nixpkgs-unstable --run "nix --version"
nix (Nix) 2.18.1


### Misc:
* home mgr -> manage .config in home 
* nix really does not seem to enjoy global installs of various deps, so I should handle that with extrapackages
for said deps - tried this, some of the globals have to stay but thankfully we have flakes
* setup shell.nix files in various folders - done 
* there is a pull request in protonvpn-cli that I want to use if it doesn't get merged that allows you to select the protocol 
* maybe set an alias for ls = ls -la
### Gnome niceties to account for missing with tiling wm install:
* the ability to save as sudo in vscode
	Fix: sudoedit default editor gets assigned to vscode, but what happens when I need to revert to TTY?
* Hardware plug and play software



