{inputs}: final: prev: {
  neovim-jreydman =
    (inputs.nvf.lib.neovimConfiguration {
      pkgs = final;
      modules = [
        ./configuration.nix
      ];
    }).neovim;
}
