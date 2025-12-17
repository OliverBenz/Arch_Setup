{ config, pkgs, ... }:

{
  home.username = "oliver";
  home.homeDirectory = "/home/oliver";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  fonts.fontconfig.enable    = true;
  nixpkgs.config.allowUnfree = true;
  home.packages = [
    # Essentials
    pkgs.brave
    pkgs.kdePackages.kate
    pkgs.flameshot
    pkgs.libsForQt5.okular
    pkgs.krita

    # Work
    pkgs.bitwarden
    pkgs.libreoffice
    pkgs.thunderbird
    # pkgs.onedrive
	pkgs.texlab
    pkgs.zotero
	pkgs.zathura

    # Recreational
    pkgs.discord
    pkgs.spotify

    #Development
	pkgs.neovim
    pkgs.gcc13
	pkgs.clang-tools
	pkgs.gnumake
	pkgs.tree-sitter
    pkgs.cmake
    pkgs.sqlite
    pkgs.gtest

	pkgs.nerd-fonts.jetbrains-mono

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".i3/config".source = dotfiles/i3Config;

    ".config/polybar/config.ini".source = dotfiles/polybar/config.ini;
    ".config/polybar/scripts/vpn-status.sh".source = dotfiles/polybar/scripts/vpn-status.sh;
    ".config/polybar/scripts/net-conn.sh".source = dotfiles/polybar/scripts/net-conn.sh;

    ".config/onedriveUni/config".source = dotfiles/onedriveUni;
    ".config/onedrivePersonal/config".source = dotfiles/onedrivePersonal;
    ".config/onedrive-launcher".source = dotfiles/onedriveLauncher;

    ".config/nvim/init.lua".source = dotfiles/nvim/init.lua;

    ".vimrc".source = dotfiles/vimrc;
    ".vim/autoload/plug.vim".source = dotfiles/plug.vim;

    ".config/picom.conf".source = dotfiles/picom;
    ".config/nixpkgs/config.nix".source = dotfiles/nixConfig.nix;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
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
  #  /etc/profiles/per-user/oliver/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  programs.git = {
    enable = true;
    userName = "Oliver benz";
    userEmail = "oliver.benz@outlook.com";
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      github = {
        host = "github.com";
        identityFile = "/home/oliver/.ssh/github";
      };
    };
  };
  services.ssh-agent.enable = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
