**# Package Configuration**

Dot files may be in this repository making this seem redundant. This File exists as a user readable backup for software that can neither be declared nore easily backed up by a simple configuration file.

**---**

**## Gnome**

**### MAY SWAP TO A WINDOW MANAGER AND INSTALL FROM A DE AS NEEDED**

I will keep this file here though because it will be relevant regardless of how much I approach to manage things in a declarative fashion.

**---**

**### Extensions**

**### Themes**

**### Icons**

This how to is not me dying on a hill for this theme so much as me testing ways to manage themes that are not a package. 

I could make a derivation:

1\. Add to flake:

   ```nix
   inputs = {

     nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

     home-manager = {

       url = "github:nix-community/home-manager";

       inputs.nixpkgs.follows = "nixpkgs";

     };

     adwaita-colors = {

       url = "github:dpejoh/Adwaita-colors";

       flake = false;

     };

   };
   ```

2\. Add to modules folder "adwaita-colors.nix", system wide for compatibility:

   ```nix
   { pkgs, src }:

   pkgs.stdenv.mkDerivation {

     pname = "adwaita-colors";

     version = "unstable";

     inherit src;

     nativeBuildInputs = [

       pkgs.gtk3

     ];

     dontBuild = true;

     installPhase = ''

       runHook preInstall

       mkdir -p "$out/share/icons"

       # The upstream setup script is both the generator and installer.
       # Strip off its interactive/installation logic and retain its
       # generation functions.

       sed '/^# --- Main ---/,$d' "$src/setup" > setup-lib
       source ./setup-lib

       # Upstream searches /usr/share/icons, but Nix stores Adwaita
       # in the Nix store, so provide the correct source explicitly.

       find_adwaita() {

         echo "${pkgs.adwaita-icon-theme}/share/icons/Adwaita"

       }

       for variant in "''${ALL_VARIANTS[@]}"; do

         generate_variant \

           "$variant" \

           "$out/share/icons" \

           "$(find_adwaita)" \

           false

       done

       # Generate the icon caches that upstream normally creates during
       # its system-wide installation.

       for variant in "''${ALL_VARIANTS[@]}"; do

         gtk-update-icon-cache \

           -f \

           "$out/share/icons/Adwaita-$variant"

       done

       runHook postInstall

     '';

     meta = {

       description = "Adwaita icon theme variants matching GNOME accent colors";

       homepage = "https://github.com/dpejoh/Adwaita-colors";

       license = pkgs.lib.licenses.gpl3;

       platforms = pkgs.lib.platforms.linux;

     };

   }
   ```

3\. Add the module to the configuration.nix file. 

Alternatively, I could just extract icon packs to .icons in my home folder. 

**### Wallpaper**

**---**

**## VSCode**

**### Extensions**

Should actually be set up with Home Manager.

**### Config**