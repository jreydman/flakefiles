{
  experimental-features = "nix-command flakes repl-flake";
  auto-optimise-store = true; # maybe causes build failures
  allowed-users = ["@wheel" "nix-serve"];
  #trusted-users = ["@wheel"];

  extra-substituters = [
    "https://nix-community.cachix.org"
    "https://cache.nixos.org"
    "https://devenv.cachix.org"
    "https://cosmic.cachix.org/"
    "https://cache.thalheim.io" # sops-nix
  ];
  extra-trusted-public-keys = [
    "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    "nas.grandperrin.fr:QwhwNrClkzxCvdA0z3idUyl76Lmho6JTJLWplKtC2ig="
    "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
    "cache.thalheim.io-1:R7msbosLEZKrxk/lKxf9BTjOOH7Ax3H0Qj0/6wiHOgc=" # sops-nix
  ];
}
