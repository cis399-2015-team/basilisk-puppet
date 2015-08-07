class smbd {
    package {
        'samba': ensure => installed;
    }

    file { '/etc/samba/smb.conf':
        source  => 'puppet:///modules/smbd/smb.conf',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['samba'],
    }

    file { '/home/ubuntu/share':
        ensure  => 'directory',
        mode    => 644,
        owner   => ubuntu,
        group   => ubuntu,
    }

    service { 'smbd':
        enable    => true,
        ensure    => running,
        require   => [ Package['samba'],
                       File['/etc/samba/smb.conf'],
                       File['/home/ubuntu/share'] ],
        subscribe => File['/etc/samba/smb.conf'],
    }
}
