{ pkgs, ... }:
let
  python3 = pkgs.python3.withPackages
    (p: with p; [ flake8 requests python-lsp-server pynvim ipython ]);
in { home = { packages = with pkgs; [ python3 ]; }; }
