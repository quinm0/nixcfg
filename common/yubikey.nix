{ config, pkgs, ... }:

{
  services.udev.packages = [ pkgs.yubikey-personalization ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  environment.systemPackages = with pkgs; [
    yubikey-manager
    pam_u2f
    #yubikey-personalization-gui #This is causing a lockout issue
  ];
}
