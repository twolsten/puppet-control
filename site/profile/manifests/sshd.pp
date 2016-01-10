class profile::sshd {

  class {ssh:
    sshd_config_print_motd => 'yes',
    sshd_config_banner     => '/etc/banner',
    sshd_x11_forwarding    => 'yes',
    permit_root_login      => 'no',
  }
}

