{
  description = "Flakefiles | <pikj.reyderman@gmail.com>";

  nixConfig = {
    extra-substituters = [
      #"http://nixos-nas.wg:5000"
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
      "https://devenv.cachix.org"
      #"https://cosmic.cachix.org/"
      "https://cache.thalheim.io" # sops-nix
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "nas.grandperrin.fr:QwhwNrClkzxCvdA0z3idUyl76Lmho6JTJLWplKtC2ig="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      #"cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      "cache.thalheim.io-1:R7msbosLEZKrxk/lKxf9BTjOOH7Ax3H0Qj0/6wiHOgc=" # sops-nix
    ];
  };

  inputs = import ./inputs.nix;

  outputs = inputs: {
    inherit inputs;

    schemas = import ./schemas.nix inputs;
    overlays = import ./overlays.nix inputs;
    packages = import ./packages.nix inputs;
    darwinConfigurations = import ./darwin.nix inputs;
  };
}
