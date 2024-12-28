{ pkgs, audi, ... }:
let
  packages = with pkgs;
    [
      chafa
      eza
      fd
      gh
      httpie
      neofetch
      jq
      nodejs
      nixfmt-classic
      ripgrep
      tldr
      unzip
      uv
      zoxide
    ];
in { home = { inherit packages; }; }
