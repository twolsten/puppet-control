class profile::sshd {

  class ssh {
    package {'openssh-server':
      ensure => 'installed',
    }

    service {'sshd':
      ensure  => 'running',
      enable  => 'true',
      require => Package["openssh-server"],
    }

    augeas { 'configure_sshd':
      context => '/files/etc/ssh/sshd_config',
      changes => [ "set PermitRootLogin no",
                   "set Banner '/etc/banner",
                ],
      require => Package['openssh-server'],
      notify  => Service['sshd'],
    }
  }
}

  
