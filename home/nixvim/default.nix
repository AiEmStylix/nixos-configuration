{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";
    opts = {
      tabstop = 4;
      shiftwidth = 4;
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
      };
    };

    plugins.conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          lsp_fallback = true;
          timeout_ms = 1000;
        };
        # Định nghĩa formatter cho từng loại ngôn ngữ
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
