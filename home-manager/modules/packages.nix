{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    neovim
    htop
    curl
    ripgrep
    unzip
    librewolf
    fzf
    statix
    meslo-lg
    meslo-lgs-nf
    haskell-language-server
  ];
}
