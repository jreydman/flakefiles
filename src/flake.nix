{
  description = "My personal Nix configuration";

  inputs = {
    nixpkgs-stable-channel.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable-channel.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs-stable-channel";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-stable-channel";
    };

    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
      # inputs.nixpkgs.follows = "nixpkgs-stable-channel";
    };

    nix-homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    nix-homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    nix-homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs-stable-channel";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs-stable-channel";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs-stable-channel";
    };
  };

  outputs = inputs: import ./outputs.nix {inherit inputs;};
}
