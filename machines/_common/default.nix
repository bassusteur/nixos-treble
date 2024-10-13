{ config, ... }:

{
  # Locale stuff
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # tmpfs :3
  fileSystems."/tmp" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=8G" "mode=755" ];
  };

  # for nixos-rebuild build-vm or config.system.build.vm
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 4096;
      cores = 4;
    };
  };
}
