class samba {
    package {
        'samba': ensure => installed;
    }

    file { '/etc/samba/smb.conf':
        source  => 'puppet:///modules/samba/smb.conf',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['samba'],
    }

    file { '/usr/sbin/smbadduser':
        mode   => 755,
        owner  => root,
        group  => root,
        source => 'puppet:///modules/samba/smbadduser'
    }

    service { 'smbd':
        enable    => true,
        ensure    => running,
        require   => [ Package['samba'],
                       File['/etc/samba/smb.conf'] ],
        subscribe => File['/etc/samba/smb.conf'],
    }
}
