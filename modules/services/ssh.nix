{ options, config, pkgs, lib, ... }:

with lib;
with lib.my;
let cfg = config.modules.services.ssh;
in {
  options.modules.services.ssh = {
    enable = mkBoolOpt false;
  };

  config = mkIf cfg.enable {

    programs.ssh.extraConfig = "IdentityFile ~/.ssh/${config.networking.hostName}";

    services.openssh = {
      enable = true;
      settings = {
        KbdInteractiveAuthentication = false;
        PasswordAuthentication = false;
      };
    };

    user.packages = with pkgs; [
      sshpass
    ];

    user.openssh.authorizedKeys.keys =
      if config.user.name == "jpesenhofer"
      then [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM6pxS+faVh8CTTHw2ZZwnm9s54xNpDC6RJzxg43452g jpesenhofer@purple"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILplKT9yCU7in8VjPsxtxLZrhU8PajUJZascd0J4ILGv jpesenhofer@violet"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIT5s6+Feov4htIAeAuAa4VNqpXFuXVUf+jgnxQ7alqp jpesenhofer@grape"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINbvZOQhvooGSNuIIQdXMrNa7zyJ6PsYFKzDAMAEMR9x jpesenhofer@moooh"
      ]
      else [ ];
  };
}
