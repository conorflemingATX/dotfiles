# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/control-center" = {
      "last-panel" = "sound";
    };

    "org/gnome/desktop/input-sources" = {
      "current" = "uint32 0";
      "sources" = [ (mkTuple [ "xkb" "us" ]) ];
      "xkb-options" = [ "eurosign:e" ];
    };

    "org/gnome/desktop/interface" = {
      "gtk-im-module" = "gtk-im-context-simple";
      "text-scaling-factor" = 1.4;
    };

    "org/gnome/desktop/privacy" = {
      "report-technical-problems" = true;
    };

    "org/gnome/desktop/wm/preferences" = {
      "num-workspaces" = 3;
    };

    "org/gnome/evolution-data-server" = {
      "migrated" = true;
      "network-monitor-gio-name" = "";
    };

    "org/gnome/mutter" = {
      "attach-modal-dialogs" = true;
      "dynamic-workspaces" = false;
      "edge-tiling" = true;
      "focus-change-on-pointer-rest" = true;
      "workspaces-only-on-primary" = false;
    };

    "org/gnome/settings-daemon/plugins/color" = {
      "night-light-last-coordinates" = mkTuple [ 30.218499 (-97.7972) ];
    };

    "org/gnome/settings-daemon/plugins/xsettings" = {
      "antialiasing" = "grayscale";
      "hinting" = "slight";
    };

    "org/gnome/shell" = {
      "enabled-extensions" = "@as []";
    };

    "org/gnome/shell/world-clocks" = {
      "locations" = "@av []";
    };

    "org/gnome/system/location" = {
      "enabled" = true;
    };

    "org/gnome/terminal/legacy" = {
      "theme-variant" = "dark";
    };

    "org/gnome/terminal/legacy/profiles:" = {
      "default" = "ed87f63d-9d01-4a71-8c5b-6f0d674b7b49";
      "list" = [ "ed87f63d-9d01-4a71-8c5b-6f0d674b7b49" ];
    };

    "org/gnome/terminal/legacy/profiles:/:ed87f63d-9d01-4a71-8c5b-6f0d674b7b49" = {
      "background-color" = "#282A36";
      "bold-color" = "#6E46A4";
      "bold-color-same-as-fg" = false;
      "font" = "FiraCode Nerd Font Mono 11";
      "foreground-color" = "#F8F8F2";
      "palette" = [ "#262626" "#E356A7" "#42E66C" "#E4F34A" "#9B6BDF" "#E64747" "#75D7EC" "#EFA554" "#7A7A7A" "#FF79C6" "#50FA7B" "#F1FA8C" "#BD93F9" "#FF5555" "#8BE9FD" "#FFB86C" ];
      "use-system-font" = false;
      "use-theme-colors" = false;
      "visible-name" = "Default";
    };

  };
}
