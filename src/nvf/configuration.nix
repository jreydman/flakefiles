{pkgs, ...}: {
  config.vim = {
    extraPackages = [
      pkgs.ripgrep
      pkgs.tree-sitter
      pkgs.fd
      pkgs.prettierd
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

    mini = {
      statusline.enable = true;
      surround.enable = true;
      comment.enable = true;
      completion.enable = true;
      pairs.enable = true;
    };

    utility.snacks-nvim = {
      enable = true;
      setupOpts = {
        quickfile.enabled = true;
        indent.enabled = true;
        scroll.enabled = true;
        picker = {
          enabled = true;
          focus = "list";
          sources.explorer = {
            auto_close = true;
            hidden = true;
            layout = {
              preset = "default";
              preview = "preview";
            };
          };
        };
      };
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true; # show types just in buffer
      # lspSignature.enable = true; # show signature while type func params
      # lspkind.enable = true; # ui wrapper for completions
    };

    formatter.conform-nvim = {
      enable = true;
      setupOpts.formatters_by_ft = {
        typescript = ["prettierd"];
        typescriptreact = ["prettierd"];
        json = ["prettierd"];
      };
    };
    languages = {
      enableTreesitter = true;
      enableFormat = true;

      nu.enable = true;

      nix.enable = true;

      lua.enable = true;

      rust = {
        enable = true;
        lsp.package = pkgs.rust-analyzer-nightly;
      };

      python.enable = true;

      ts = {
        enable = true;
        extensions = {
          ts-error-translator.enable = true;
        };
        format.enable = false;
      };
    };

    keymaps = import ./keymaps.nix;

    assistant.supermaven-nvim.enable = true;
  };
}
