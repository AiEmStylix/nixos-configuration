{
    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        plugins = with pkgs.vimPlugins; [
            nvim-treesitter.withAllGrammars
        ];
        extraPackages = [
            lua-language-server
            vue-language-server
            nil
        ];
    };
}
