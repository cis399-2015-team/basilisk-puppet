class smbclient {
    package {
        'cifs-utils': ensure => installed;
    }

    group { 'samba':
        ensure => 'present',
    }

    user { 'ubuntu':
        groups     => ['samba'],
        membership => minimum,
    }
    
    file { '/etc/sudoers':
        mode   => 440,
        owner  => root,
        group  => root,
        source => 'puppet:///modules/sudo/sudoers'
    }
}
