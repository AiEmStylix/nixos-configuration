{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;

    globals.mapleader = " ";
    opts = {
      tabstop = 4;
      shiftwidth = 2;
      expandtab = true;
      softtabstop = 4;
      autoindent = true;
      smartindent = true;
      number = true;
      relativenumber = true;

    };
    plugins.lualine.enable = true;
    colorschemes.catppuccin.enable = true;

    plugins.oil = {
      enable = true;
      settings = {
        default_file_explorer = true;
        delete_to_trash = true;
        skip_confirm_for_simple_edits = true;
        view_options = {
          show_hidden = true;
        };
      };
    };

    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lsp_fallback = true;
          timeout_ms = 1000;
        };
        # Formatter cho each language
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          go = [
            "goimports"
            "gofumpt"
          ];
          vue = [ "prettier" ];
          javascript = [ "prettier" ];
          typescript = [ "prettier" ];
          rust = [ "rustfmt" ];
          cpp = [ "clang-format" ];
        };
      };
    };

    # LSP Server for code completion
    plugins.lsp = {
      enable = true;
      servers.gopls.enable = true;
    };

    plugins.blink-cmp = {
      enable = true;
    };

    plugins.fidget.enable = true;

    plugins.render-markdown = {
      enable = true;
    };

    extraPackages = with pkgs; [
      nixfmt
      gotools # Chứa goimports
      gofumpt # Formatter chuẩn và chặt chẽ của Go
      nodePackages.prettier
      rustfmt
      clang-tools # Chứa clang-format cho C++
    ];

    # --- 4. Phím tắt (Keymaps) ---
    keymaps = [
      {
        # Nhấn dấu trừ (-) để mở Oil ở thư mục hiện tại
        mode = "n";
        key = "-";
        action = "<CMD>Oil<CR>";
        options.desc = "Mở thư mục cấp cha bằng Oil";
      }
    ];
  };
}
