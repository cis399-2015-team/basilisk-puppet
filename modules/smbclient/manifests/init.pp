class smbclient {
    package {
        'cifs-utils': ensure => installed;
    }

    package {
        'smbclient': ensure => installed;
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
        source => 'puppet:///modules/smbclient/sudoers'
    }

    file { '/usr/sbin/mountserver':
        mode   => 744,
        owner  => root,
        group  => root,
        source => 'puppet:///modules/smbclient/mountserver'
    }
}
