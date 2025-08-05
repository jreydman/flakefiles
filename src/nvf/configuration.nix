{pkgs, ...}: {
  config.vim = {
    extraPackages = [
      pkgs.ripgrep
      pkgs.tree-sitter
    ];

    withNodeJs = true;

    options = {
      wrap = false;
      tabstop = 2;
      shiftwidth = 2;
    };

    clipboard = {
      enable = true;
      registers = "unnamedplus";
    };

    theme = {
      enable = true;
      name = "gruvbox";
      style = "dark";
      transparent = true;
    };

    ui.borders.plugins = {
      lsp-signature.enable = true;
    };
    mini = {
      statusline.enable = true;
      surround.enable = true;
      comment.enable = true;
      completion.enable = true;
      pick.enable = true;
      pairs.enable = true;
    };

    lsp = {
      enable = true;
      inlayHints.enable = true; # show types just in buffer
      lspSignature.enable = true; # show signature while type func params
      # lspkind.enable = true; # ui wrapper for completions
    };

    languages = {
      enableTreesitter = true;
      enableFormat = true;

      nix.enable = true;
      lua.enable = true;
      rust = {
        enable = true;
        lsp.package = pkgs.rust-analyzer-nightly;
      };
    };

    keymaps = import ./keymaps.nix;
  };
}
