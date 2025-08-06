{
  pkgs,
  pkgs-unstable,
  inputs,
  lib,
  globals,
  ...
}: {
  xdg.enable = true;

  home = {
    stateVersion = "25.05";

    username = globals.username;
    homeDirectory = "/Users/${globals.username}";

    packages = [
      pkgs-unstable.lima
      pkgs.just
      pkgs.neovim-jreydman
      pkgs.tealdeer
      pkgs.pkg-config
      pkgs.imagemagick
      pkgs.opencv
      pkgs.nushellPlugins.skim
      pkgs.nushellPlugins.highlight
      pkgs.skim
      pkgs.sshfs
      pkgs.uv
      pkgs.bun

      (pkgs.fenix.complete.withComponents [
        "cargo"
        "clippy"
        "rust-src"
        "rustc"
        "rustfmt"
      ])
      pkgs.cargo-watch
      pkgs.diesel-cli
    ];
  };

  programs = {
    home-manager.enable = true;
    lazydocker.enable = true;
    lazygit.enable = true;

    nushell = {
      enable = true;
      configFile.text = ''
        $env.config.show_banner = false
        $env.config.keybindings ++= [{
          name: launch_yazi
          modifier: control
          keycode: char_y
          mode: emacs
          event: {
            send: executehostcommand,
            cmd: "yazi"
          }
        }]
      '';
      envFile.text = builtins.readFile ../nushell/environment.nu;
      environmentVariables = {
        LIMA_HOME = lib.hm.nushell.mkNushellInline "$env.HOME + /.local/share/lima";
        DOCKER_HOST = lib.hm.nushell.mkNushellInline "'unix://' + $env.HOME + /.local/share/lima/docker/sock/docker.sock";
        BUN_INSTALL = lib.hm.nushell.mkNushellInline "$env.HOME + /.local/share/bun";
        CARGO_HOME = lib.hm.nushell.mkNushellInline "$env.HOME + /.local/share/cargo";
        DYLD_LIBRARY_PATH = "${pkgs.libclang.lib}/lib";
        PKG_CONFIG_PATH = "${pkgs.opencv}/lib/pkgconfig";
      };
      shellAliases = {
        ldocker = "lazydocker";
        lgit = "lazygit";
        ll = "ls -l";
      };
      plugins = [
        pkgs.nushellPlugins.highlight
        pkgs.nushellPlugins.skim
      ];
    };

    starship = {
      enable = true;
      settings = builtins.fromTOML (builtins.readFile ../starship/config.toml);
    };

    yazi = {
      enable = true;
      settings.mgr = {
        show_hidden = true;
        sort_dir_first = true;
      };
    };

    git = {
      enable = true;
      userName = globals.username;
      userEmail = globals.email;
      ignores = [".DS_Store"];
    };

    ssh = {
      enable = true;
      addKeysToAgent = "confirm";
      forwardAgent = true;
      matchBlocks = {
        github = {
          hostname = "github.com";
          user = "git";
          identityFile = "~/.ssh/id_ed25519";
        };
        tl-storage-dev = {
          hostname = "10.41.0.64";
          user = "tldev";
          identityFile = "~/.ssh/id_ed25519";
        };
      };
    };
  };
}
