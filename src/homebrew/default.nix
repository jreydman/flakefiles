{ inputs, host-platform, hostname, globals, ... }:

{
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    autoMigrate = true;
    mutableTaps = false;
    user = globals.username;
    taps = {
      "homebrew/homebrew-core" = inputs.nix-homebrew-core;
      "homebrew/homebrew-cask" = inputs.nix-homebrew-cask;
      "homebrew/homebrew-bundle" = inputs.nix-homebrew-bundle;
    };
  };

  homebrew = {
    enable = true;

    global.autoUpdate = true;

    brews = [
    ];

    casks = [
      "raycast" # spotlight
      "zen-browser" # browser
      "ghostty" # terminal
      "ayugram" # telegram
      "whatsapp" # whatsapp
      "vesktop" # discord
      "pgadmin4"
      "macfuse"
    ];

    masApps = {
      Xcode = 497799835;
    };
  };
}
