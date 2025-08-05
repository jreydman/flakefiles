{inputs, ...}:
with inputs; let
  host-platform = "aarch64-darwin";
  hostname = "Oleksandrs-MacBook-Air";

  globals = {
    username = "jreydman";
    fullname = "Pikj Reyderman";
    email = "pikj.reyderman@gmail.com";
  };

  overlays = [
    inputs.fenix.overlays.default
    (import ./nvf/overlay.nix { inherit inputs; })
  ];

  pkgs-archive = let
    common = {channel}:
      import channel {
        system = host-platform;
        config.allowUnfree = true;
    	inherit overlays;
    };
    in {
      stable = common {channel = inputs.nixpkgs-stable-channel;};
      unstable = common {channel = inputs.nixpkgs-unstable-channel;};
    };
in {
  darwinConfigurations.${hostname} = import ./darwin {
    inherit inputs host-platform hostname globals pkgs-archive;
  };

  homeConfigurations.${globals.username} = import ./home {
    inherit inputs host-platform hostname globals pkgs-archive;
  };
}
