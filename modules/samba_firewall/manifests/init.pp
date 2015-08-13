class samba_firewall {
  include stdlib::stages

  class { 'firewall':             stage => 'setup'  }
  class { 'samba_firewall::pre':  stage => 'setup'  }
  class { 'samba_firewall::post': stage => 'deploy' }

  resources { 'firewall':
    purge => true,
  }
}
