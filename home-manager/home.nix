{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "junot";
    homeDirectory = "/home/junot";

    stateVersion = "24.11"; # Please read the comment before changing.

    packages = [ ];

    # Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # Manager can also manage your environment variables through
    # 'sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Manager. If you don't want to manage your shell
    # through Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/junot/etc/profile.d/hm-session-vars.sh
    #
    sessionVariables = {
      # EDITOR = "emacs";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./modules/packages.nix
    ./modules/nixvim.nix
    # ./modules/nix/home.nix
    # ./modules/octave.nix
  ];
}
