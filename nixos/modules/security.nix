{ config, lib, pkgs, ... }: {
  boot = {
    kernel.sysctl = {
      # Hide kernel pointers
      "kernel.kptr_restrict" = 2;

      # Restrict access to kernel logs
      "kernel.dmesg_restrict" = 1;

      # Restrict performance monitoring
      "kernel.perf_event_paranoid" = 2;

      # Restrict process memory inspection
      "kernel.yama.ptrace_scope" = 1;

      # Disable unprivileged BPF
      "kernel.unprivileged_bpf_disabled" = 1;

      # Protect temporary files and links
      "fs.protected_hardlinks" = 1;
      "fs.protected_symlinks" = 1;
      "fs.protected_regular" = 2;
      "fs.protected_fifos" = 2;

      # Disable IPv4 source routing and redirects
      "net.ipv4.conf.all.accept_source_route" = 0;
      "net.ipv4.conf.default.accept_source_route" = 0;
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.default.send_redirects" = 0;

      # IPv6 redirects
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;

      # Ignore broadcast ICMP
      "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
    };

    kernelParams = [
      "slab_nomerge"
      "page_alloc.shuffle=1"
    ];
  };

  security = {
    protectKernelImage = true;
    sudo.execWheelOnly = true;
  };
}
