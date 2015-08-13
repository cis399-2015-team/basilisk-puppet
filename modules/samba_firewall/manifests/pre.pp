class samba_firewall::pre {
  Firewall {
    require => undef,
  }

  firewall { '000 accept all icmp':
    proto  => 'icmp',
    action => 'accept',
  }->

  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }->

  firewall { '002 reject local traffic not on loopback interface':
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.1/8',
    action      => 'reject',
  }->

  firewall { '003 accept related established rules':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }->

  firewall { '004 accept SSH':
      port     => 22,
      proto    => tcp,
      action   => accept,
  }->

  firewall { '005 accept HTTP':
      port     => 80,
      proto    => tcp,
      action   => accept,
  }->

  firewall { '006 accept Puppet':
      port     => 8140,
      proto    => tcp,
      action   => accept,
  }->

  firewall { '007 accept IMAP':
      port     => 143,
      proto    => tcp,
      action   => accept,
  }->

  firewall { '008 accept SMTP':
      port     => 25,
      proto    => tcp,
      action   => accept,
  }->

  firewall { '009 accept samba 137':
      port     => 137,
      proto    => tcp,
      destination => '10.0.3.0/24',
      action   => accept,
  }->

  firewall { '010 accept samba 138':
      port     => 138,
      proto    => tcp,
      destination => '10.0.3.0/24',
      action   => accept,
  }->

  firewall { '011 accept samba 139':
      port     => 139,
      proto    => tcp,
      destination => '10.0.3.0/24',
      action   => accept,
  }->

  firewall { '012 accept samba 445':
      port     => 445,
      proto    => tcp,
      destination => '10.0.3.0/24',
      action   => accept,
  }
}
