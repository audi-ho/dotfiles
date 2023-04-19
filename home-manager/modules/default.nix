{ config, pkgs, lib, ben, ... }:
let
  inherit (lib) mkOption types;
  inherit (ben) username homeDirectory;
in {
  imports = [
    ./fzf.nix
    ./git.nix
    ./ideavim
    ./neovim
    ./nnn.nix
    ./packages.nix
    ./python.nix
    ./ranger
    ./starship.nix
    ./tmux
    ./zsh
  ];

  options.ben = {
    username = mkOption {
      type = types.str;
      default = "ben";
      description = ''
        Username of the user to provision on the system.
      '';
    };

    homeDirectory = mkOption {
      type = types.str;
      default = "/home/ben";
      description = ''
        Home directory of the user.
      '';
    };
  };

  config = {
    home = {
      inherit username homeDirectory;
      stateVersion = "22.11";
    };
    xdg.configFile."fd/ignore".text = ".git";
    programs = { home-manager.enable = true; };
  };
}
