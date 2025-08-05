{
  inputs,
  host-platform,
  hostname,
  globals,
  pkgs-archive,
}:
inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = pkgs-archive.stable;

  extraSpecialArgs = {
    inherit inputs host-platform hostname globals;
    pkgs-unstable = pkgs-archive.unstable;
  };

  modules = [
    ./configuration.nix
  ];
}
