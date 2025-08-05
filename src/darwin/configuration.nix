{ pkgs, pkgs-unstable, globals, ... }:

{
  system = {
    stateVersion = 5;
    primaryUser = globals.username;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment = {
    shells = [ pkgs.nushell pkgs.bashInteractive pkgs.zsh  ];
  };

  users.users.${globals.username} = {
    name = globals.username;
    home = "/Users/${globals.username}";
    shell = pkgs.nushell;
  };

  security.pam.services.sudo_local.touchIdAuth = true;
}
