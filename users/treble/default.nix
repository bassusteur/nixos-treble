{ config, pkgs, lib, ... }:

{
  home-manager.users."treble" = ./home.nix;

  users.users."treble" = {
    isNormalUser = true;
    description = "treble";
    # shell = pkgs.zsh;
    extraGroups = [ "wheel" "plugdev" "dialout" ] ++ (lib.optional config.networking.networkmanager.enable "networkmanager");

    # openssh.authorizedKeys.keys = [ "..." ];
    initialPassword = "12345678";
  };
}
