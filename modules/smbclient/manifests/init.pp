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
        source => 'puppet:///modules/smbclient/sudoers'
    }

    file { '/home/ubuntu/mnt':
        ensure  => 'directory',
        mode    => 644,
        owner   => ubuntu,
        group   => ubuntu,
    }
}
