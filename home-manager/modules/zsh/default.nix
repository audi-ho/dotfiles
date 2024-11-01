{ pkgs, ... }:
let
  shellAliases = {
    v = "nvim";
    vim = "nvim";
    ls = "eza --icons=always";
    lg = "lazygit";
    cat = "bat";
    nnn = "nnn -APp";
  };
in {
  home.packages = with pkgs; [ zsh ];
  programs = {
    fzf.enableZshIntegration = true;

    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      dotDir = ".config/zsh";
      oh-my-zsh = {
        enable = true;
        plugins = [ "gitfast" ];
        theme = "clean";
      };
      inherit shellAliases;
      sessionVariables = {
        EDITOR = "nvim";
        GIT_EDITOR = "nvim";
        ZSH_TMUX_AUTOSTART = "false";
        PATH = "\${PATH}";
        TSC_WATCHFILE = "PriorityPollingInterval";
      };

      initExtra = (builtins.readFile ./zshrc);
    };
  };
}
