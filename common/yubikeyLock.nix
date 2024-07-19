{ config, pkgs, ... }:

let
  u2f_keys_content = ''
    qmoran:ca/RlE2uQqswjfcjFQZx8LWT7W6lXr9W6pcx3YOSO8EsJnTQRO7B+gvYMQG/dlcwj4ea5UuPC3slrMQLG4haHQ==,1N3tbJ2eaDS9A2QCkjxuxctEhIlpf0vAx9SSBMhJoDKKAahk1mUAbT9xv9MA3ipYHBhrLrHU/M7WS3iK9fDUoA==,es256,+presence:xG3YAZmdHPNRrJeT+8mZ/IUwEHe83tzbbAtTDyjufVDGWKcXtv62U+uEj7VhoPL12mGwnNM9zRHet4Y0px/GkQ==,Bj/2u0NJHLwrCQTQwgYefkXVKowPrkin8EEyjDlfUjvBiA1QGtcyRHXSBSJkthKurc9n7s04/za2cpBKQow8LA==,es256,+presence
  '';
in
{
  security.pam = {
    u2f.authFile = "/etc/Yubico/u2f_keys";
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;

      login.unixAuth = false;
      sudo.unixAuth = false;

    };
  };

  environment.etc."Yubico/u2f_keys" = {
    text = u2f_keys_content;
    user = "root";
    group = "root";
    mode = "0600";
  };

  services.udev.extraRules = ''
      ACTION=="remove",\
       ENV{ID_BUS}=="usb",\
       ENV{ID_MODEL_ID}=="0407",\
       ENV{ID_VENDOR_ID}=="1050",\
       ENV{ID_VENDOR}=="Yubico",\
       RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  '';

}
