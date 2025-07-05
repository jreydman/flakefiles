{
  nixpkgs = {
    type = "indirect"; # take it from the registry
    id = "nixpkgs";
  };

  flake-schemas.url = "github:DeterminateSystems/flake-schemas";

  # ----------------------------------------------------

  nixos-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
  nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

  nixos-stable-lib.url = "github:NixOS/nixpkgs/nixos-25.05?dir=lib";
  nixos-unstable-lib.url = "github:NixOS/nixpkgs/nixos-unstable?dir=lib";

  # nixos-stable-small.url = "github:NixOS/nixpkgs/nixos-25.05-small";
  # nixos-unstable-small.url = "github:NixOS/nixpkgs/nixos-unstable-small";

  darwin-stable.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
  darwin-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  # ----------------------------------------------------

  nur.url = "github:nix-community/NUR";

  nix-on-droid = {
    url = "github:nix-community/nix-on-droid/master";
    #url = "github:nix-community/nix-on-droid/release-25.05";
    inputs = {
      nixpkgs.follows = "nixos-stable-lib";
      home-manager.follows = "home-manager-stable"; # TODO try to remove
    };
  };

  nix-darwin = {
    url = "github:lnl7/nix-darwin/master";
    inputs.nixpkgs.follows = "nixos-stable-lib";
  };

  devshell = {
    url = "github:numtide/devshell";
    inputs.nixpkgs.follows = "nixos-stable-lib";
  };

  rust-overlay = {
    url = "github:oxalica/rust-overlay";
    inputs = {
      nixpkgs.follows = "nixos-stable";
    };
  };

  home-manager-stable = {
    url = "github:nix-community/home-manager/release-25.05";
    inputs.nixpkgs.follows = "nixos-stable-lib";
  };

  home-manager-unstable = {
    url = "github:nix-community/home-manager/master";
    inputs.nixpkgs.follows = "nixos-unstable-lib";
  };

  nix-alien = {
    url = "github:thiagokokada/nix-alien";
    inputs = {
      nixpkgs.follows = "nixos-stable-lib";
      flake-compat.follows = "flake-compat";
      flake-utils.follows = "flake-utils";
      nix-index-database.follows = "nix-index-database";
    };
  };

  sops-nix = {
    url = "github:Mic92/sops-nix";
    inputs = {
      nixpkgs.follows = "";
    };
  };

  git-hooks = {
    url = "github:cachix/git-hooks.nix";
    inputs = {
      nixpkgs.follows = "nixos-stable-lib";
      flake-compat.follows = "flake-compat";
      nixpkgs-stable.follows = "nixos-stable-lib";
    };
  };

  nix-index-database = {
    url = "github:Mic92/nix-index-database";
    inputs.nixpkgs.follows = "nixos-stable";
  };

  nixos-generators = {
    url = "github:nix-community/nixos-generators";
    inputs.nixpkgs.follows = "nixos-stable";
  };

  crane = {
    # eventually, use dream2nix when it's more stable
    url = "github:ipetkov/crane";
  };

  flake-utils = {
    url = "github:numtide/flake-utils";
  };

  flake-compat = {
    url = "github:edolstra/flake-compat";
    flake = false;
  };

  flake-parts = {
    url = "github:hercules-ci/flake-parts";
    inputs.nixpkgs-lib.follows = "nixos-stable-lib";
  };

  devenv = {
    url = "github:cachix/devenv";
    inputs = {
      #nixpkgs.follows = "nixpkgs"; # don't override so that the cache can be used
      flake-compat.follows = "flake-compat";
      #nix.follows = "nix"; # don't override so that the cache can be used
      git-hooks.follows = "git-hooks";
    };
  };

  android-nixpkgs = {
    url = "github:tadfisher/android-nixpkgs/stable";
    inputs = {
      nixpkgs.follows = "nixos-stable";
      devshell.follows = "devshell";
      flake-utils.follows = "flake-utils";
    };
  };

  nixvim = {
    url = "github:nix-community/nixvim/nixos-25.05";
    inputs = {
      nixpkgs.follows = "nixos-stable";
      home-manager.follows = "home-manager-stable";
      nix-darwin.follows = "nix-darwin";
      flake-parts.follows = "flake-parts";
      flake-compat.follows = "flake-compat";
      git-hooks.follows = "git-hooks";
    };
  };

  nix-inspect = {
    url = "github:bluskript/nix-inspect";
    inputs = {
      #nixpkgs.follows = "nixos-stable";
      #parts.follows = "flake-parts";
    };
  };

  nixpkgs-update = {
    url = "github:ryantm/nixpkgs-update";
    inputs = {
      # nixpkgs.follows = "nixos-stable"; # don't override so that we can use the cache
    };
  };

  bugstalker = {
    url = "github:godzie44/BugStalker";
    inputs = {
      nixpkgs.follows = "nixos-stable";
      rust-overlay.follows = "rust-overlay";
      flake-parts.follows = "flake-parts";
    };
  };

  srvos = {
    url = "github:nix-community/srvos";
    inputs = {
      nixpkgs.follows = "nixos-stable-lib";
    };
  };

  system-manager = {
    url = "github:numtide/system-manager";
    inputs = {
      nixpkgs.follows = "nixos-stable";
    };
  };
}
