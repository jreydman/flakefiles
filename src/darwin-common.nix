{
  pkgs,
  config,
  lib,
  inputs,
  home-manager-flake,
  ...
}: {
  imports = [
    home-manager-flake.darwinModules.home-manager
  ];

  nixpkgs = {
    overlays = [
      (import ../../overlays.nix inputs).default
    ];
    config = import ../../nixpkgs/config.nix;
  };

  users.users.paulg = {
    home = "/Users/jreydman";
    shell = "${pkgs.fish}/bin/fish";
  };
  users.users.root = {
    home = "/var/root";
    shell = "${pkgs.fish}/bin/fish";
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = config._module.specialArgs;
  home-manager.users.root = {
    imports = [
      ../../homeModules/shared/core.nix
      ../../homeModules/shared/cmdline-extra.nix
    ];
  };
  home-manager.users.paulg = {
    imports = [
      ../../homeModules/shared/core.nix
      ../../homeModules/shared/cmdline-extra.nix
      ../../homeModules/shared/firefox.nix
      ../../homeModules/shared/chromium.nix
      ../../homeModules/shared/desktop-macos.nix
      ../../homeModules/shared/rust.nix
    ];
  };

  # nix-darwin doesn't change the shells so we do it here
  system.activationScripts.postActivation.text = ''
    echo "setting up users' shells..." >&2

    ${lib.concatMapStringsSep "\n" (user: ''
      dscl . create /Users/${user.name} UserShell "${user.shell}"
    '') (lib.attrValues config.users.users)}
  '';

  nix.settings = import ../../nix/nix.nix;

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 2d";
    interval = {
      Hour = 5;
      Minute = 0;
    };
  };

  system.defaults.NSGlobalDomain = {
    InitialKeyRepeat = 33; # unit is 15ms, so 500ms
    KeyRepeat = 2; # unit is 15ms, so 30ms
    NSDocumentSaveNewDocumentsToCloud = false;
  };

  services.nix-daemon.enable = true;

  system.stateVersion = 4;

  programs = {
    fish.enable = true;
  };

  environment.shells = [pkgs.fish];

  homebrew = {
    enable = true;
    #cleanup = "zap";
    global = {
      brewfile = true;
    };
    taps = ["homebrew/bundle" "homebrew/cask" "homebrew/core"];
    brews = [];
    casks = [
      "iterm2"
      "firefox"
      "messenger"
      "deluge"
      "discord"
      "google-drive"
      "messenger"
      "protonvpn"
      "signal"
      "telegram"
      "tor-browser"
      "visual-studio-code"
      "vlc"
      "whatsapp"
      "android-platform-tools"
      "android-file-transfer"
    ];
    masApps = {};
  };

  fonts = {
    fontDir.enable = true;
    fonts = [
      pkgs.nerd-fonts.fira-code
      # "CascadiaCode"
      # "FantasqueSansMono"
      # "FiraCode"
      # "FiraMono"
      # "Hack" # no ligatures
      # "Hasklig"
      # "Inconsolata"
      # "Iosevka"
      # "JetBrainsMono"
      # "VictorMono"
    ];
  };
}
