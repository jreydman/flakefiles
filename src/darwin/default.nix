{ inputs, host-platform, hostname, globals, pkgs-archive }:

inputs.darwin.lib.darwinSystem {
  system = host-platform;

  pkgs = pkgs-archive.stable;

  specialArgs = {
    inherit inputs host-platform hostname globals;
    pkgs-unstable = pkgs-archive.unstable;
  };

  modules = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
    ./configuration.nix
    ../homebrew
  ];
}
