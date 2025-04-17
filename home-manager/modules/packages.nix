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
    haskell-language-server
  ];
}
