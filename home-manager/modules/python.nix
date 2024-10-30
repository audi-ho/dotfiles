{ pkgs, audi, ... }:
let python3 = pkgs.python311.withPackages (p: with p; [ pynvim ipython pipx ]);
in {
  home = { packages = with pkgs; if !audi.work then [ ] else [ pipx ]; };
  programs = { pyenv = { enable = true; }; };
}
