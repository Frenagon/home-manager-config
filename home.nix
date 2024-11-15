{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage
  home.username = "frenagon";
  home.homeDirectory = "/home/frenagon";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Environment variables
  home.sessionVariables = {
    EDITOR = "code";
    NIXOS_OZONE_WL = "1";
  };

  # Install Nix packages
  home.packages = with pkgs; [
    tree
    firefox-devedition
    discord
    vscode
    wget
    kitty
    wofi
    pavucontrol
  ];

  # Add files to your home directory
  home.file = {
  };

  ##################################################
  #################### PROGRAMS ####################
  ##################################################
  programs.git = {
    enable = true;
    userName = "Francisco Aceves";
    userEmail = "frenagon@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      core.editor = "code --wait";
      merge.tool = "vscode";
      "mergetool \"vscode\"".cmd = "code --wait --merge $REMOTE $LOCAL $BASE $MERGED";
      diff.tool = "vscode";
      "difftool \"vscode\"".cmd = "code --wait --diff $LOCAL $REMOTE";
    };
    aliases = {
      undo = "reset --soft HEAD^";
    };
    delta = {
      enable = true;
      options.line-numbers = true;
    };
  };

  programs.zsh = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
