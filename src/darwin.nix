inputs: let
  mkDarwinConf = stability: module: let
    selectFlake = stable: unstable: {inherit stable unstable;}.${stability};
    nixos-flake = selectFlake inputs.nixos-stable inputs.nixos-unstable;
    home-manager-flake = selectFlake inputs.home-manager-stable inputs.home-manager-unstable;
  in
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs nixos-flake home-manager-flake;};
      modules = [module];
    };
in {
  "MacBookPaul" = mkDarwinConf "stable" ./macbook-m2-jreydman.nix;
}
