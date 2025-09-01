{
  programs.git = {
    enable = true;
    userName = "Stylix";
    userEmail = "anhduongfa@gmail.com";
    signing = {
      key = "0A906885682539C0";
      signByDefault = true;
    };
    extraConfig.init.defaultBranch = "main";
  };
}
