# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "ehci_pci" "megaraid_sas" "usbhid" "usb_storage" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/0e92ada9-effb-42e2-a26a-9cdb529bcdc7";
      fsType = "ext4";
    };

  # Manually created using:
  #   zpool create -m legacy -o ashift=12 root raidz /dev/disk/by-id/{wwn-0x5000cca25dcc966d,wwn-0x5000cca24cec02e3,wwn-0x5000cca25dcc7711,wwn-0x5000cca25dccca63,wwn-0x5000cca25dcc74b6,wwn-0x5000cca25dcc4591,wwn-0x5000cca25dcc4461}
  fileSystems."/storage" = {
    device = "root";
    fsType = "zfs";
  };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/50b73d78-12cd-4599-a774-57af14e6d9f7";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/f762b5e2-bbdd-4a02-bbd9-0bf6b11e0ab5"; }
    ];

  nix.maxJobs = lib.mkDefault 24;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}