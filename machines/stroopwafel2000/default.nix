{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./hardware-configuration.nix # hardware scan results
  ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = false;
      efiSysMountPoint = "/boot/efi";
    };
    systemd-boot.enable = true;
  };

  # Networking
  networking.hostName = "stroopwafel2000";
  networking.networkmanager.enable = true;

  # Enable touchpad support
  services.libinput.enable = true;

  hardware.rtl-sdr.enable = true;

  system.stateVersion = "24.05";
}
