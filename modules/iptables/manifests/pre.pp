class iptables::pre {

  # Default firewall rules
  firewall { '000 accept all icmp':
    proto   => 'icmp',
    action  => 'accept',
  }

  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }

  firewall { '002 accept related established rules':
    proto   => 'all',
    state   => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }

  # Allow SSH
  firewall { '100 allow ssh access':
    port   => '22',
    proto  => tcp,
    action => accept,
  }

  # Allow HTTP
  firewall { '100 allow http access':
    port   => '80',
    proto  => tcp,
    action => accept,
  }

  # Allow SMTP
  firewall { '100 allow smtp access':
    port   => '25',
    proto  => tcp,
    action => accept,
  }

  # Allow IMAP
  firewall { '100 allow imap access':
    port   => '143',
    proto  => tcp,
    action => accept,
  }

  # Allow SAMBA
  firewall { '100 allow samba access':
    port   => '445',
    proto  => tcp,
    action => accept,
  }

  # Allow SAMBA1
  firewall { '100 allow samba (137) access':
    port   => '137',
    proto  => tcp,
    action => accept,
  }

  # Allow SAMBA2
  firewall { '100 allow samba (138) access':
    port   => '138',
    proto  => tcp,
    action => accept,
  }

  # Allow SAMBA3
  firewall { '100 allow samba (139) access':
    port   => '139',
    proto  => tcp,
    action => accept,
  }

  # Allow Puppet master
  firewall { '100 allow Puppet master access':
     port   => '8140',
     proto  => tcp,
     action => accept,
  }

}
