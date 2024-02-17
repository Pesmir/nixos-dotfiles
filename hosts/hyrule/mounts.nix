{ pkgs, ... }:
{
  programs.fuse.userAllowOther = true;

  environment.systemPackages = with pkgs; [
    # Mount remote directories over SSH
    sshfs
    # Mount WebDAV shares
    davfs2
  ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/e5403cd7-d26b-4cb5-a0e0-a4198599f508";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/7556-072C";
      fsType = "vfat";
    };
  };

  swapDevices = [{ device = "/dev/disk/by-uuid/33f7ff4e-28a4-4dfc-8d44-87b3624c3a71"; }];
}
