{ config, pkgs, ... }:
let
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {};
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    nur-no-pkgs.repos.rycee.hmModules.emacs-init
    ~/.config/nixpkgs/dconf.nix
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "conor";
  home.homeDirectory = "/home/conor";

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    gnome3.gnome-tweak-tool
    dconf2nix
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
  ];

  # Enable lorri
  services.lorri.enable = true;

  # Bash Config
  programs.bash = {
    enable = true;
    shellAliases = {
      emacs = "emacs -nw";
    };
    bashrcExtra = ''
       eval `dircolors ~/.dir_colors/`
    '';
  };

  # Git Config
  programs.git = {
    enable = true;
    userName = "Conor Fleming";
    userEmail = "conorfleming@outlook.com";
    extraConfig = {
      core.editor = "emacs";
      github.username = "conorflemingATX";
    };
  };

  # Ssh Config
  programs.ssh = {
    enable = true;
  };

  # Set terminal font
  programs.gnome-terminal.profile.Default = {
    font = "Fira Code";
  };

  # Enable Nix-direnv
  programs.direnv = {
    enable = true;
    enableNixDirenvIntegration = true;
  };

  # Emacs Config
  programs.emacs = {
    enable = true;
    extraPackages = epkgs: with epkgs; [
      envrc
      no-littering
    ];
    init = {
      enable = true;
      recommendedGcSettings = true;
      prelude = ''
        ;; Disable Startup message
        (setq inhibit-startup-message t)

        ;; Clean up some visual cruft
        (scroll-bar-mode -1)
        (tool-bar-mode -1)
        (tooltip-mode -1)
        (set-fringe-mode 10)
        (menu-bar-mode 10)
        (column-number-mode)
        (global-display-line-numbers-mode)
        (global-visual-line-mode)
        
        ;; Load Packages from ExtraPackages above
        (package-initialize)
        
        ;; Envrc and No-littering are set up here for control
        ;; over execution time.
        (envrc-global-mode)        
      '';
      usePackage = {
        no-littering = {
          enable = true;
          config = ''
             ;; Do not dump autosave files into dirs,
             ;; Save to dedicated cache.
             (setq auto-save-file-name-transforms
               `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))
          '';
        };
        dracula-theme = {
          enable = true;
	        config = ''
	          (load-theme 'dracula t)
	        '';
        };
        ivy = {
          enable = true;
	        bind = { "C-s" = "swiper"; };
	        bindLocal = {
            ivy-minibuffer-map = {
	            "TAB" = "ivy-alt-done";
      	      "C-n" = "ivy-next-line";
              "C-p" = "ivy-previous-line";
	          };
   	        ivy-switch-buffer-map = {
	            "C-n" = "ivy-next-line";
      	      "C-p" = "ivy-previous-line";	    
	          };
          };
       	  config = ''
       	    (ivy-mode 1)
      	  '';
        };
        nix-mode = {
          enable = true;
        };
        org = {
          enable = true;
       	  package = epkgs: epkgs.org-plus-contrib;
        };
      };
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
