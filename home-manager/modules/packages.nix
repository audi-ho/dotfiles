{ self, pkgs, audi, ... }:
let
  packages = with pkgs;
    [
      black
      cmake
      eza
      fd
      fpp
      gh
      httpie
      luajit
      luarocks
      ncurses
      neofetch
      jq
      nodejs
      nix-prefetch-github
      nixfmt-classic
      ripgrep
      rustup
      stow
      tldr
      unzip
      zoxide
    ];
in { home = { inherit packages; }; }
