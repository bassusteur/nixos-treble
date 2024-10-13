{ pkgs, lib, osConfig, config, ... }:

let
  isGui = osConfig.services.xserver.enable;
in
{
  home.sessionVariables = {
    EDITOR = "nano";
  };

  home.packages = with pkgs; [
    nano

    # you probably want these
    discord
    firefox
  ];

  xdg.userDirs.enable = isGui;

  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
