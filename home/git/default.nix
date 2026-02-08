{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Stylix";
        email = "anhduongfa@gmail.com";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
    signing = {
      key = "0A906885682539C0";
      signByDefault = true;
    };
  };

  programs.gh.enable = true;
}
