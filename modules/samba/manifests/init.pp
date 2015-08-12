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

    file { '/home/ubuntu/share':
        ensure  => 'directory',
        mode    => 644,
        owner   => ubuntu,
        group   => ubuntu,
    }

    file { '/var/www/html':
        ensure  => 'directory',
        mode    => 755,
        owner   => root,
        group   => root,
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
                       File['/etc/samba/smb.conf'],
                       File['/home/ubuntu/share'],
                       File['/var/www/html'] ],
        subscribe => File['/etc/samba/smb.conf'],
    }
}
