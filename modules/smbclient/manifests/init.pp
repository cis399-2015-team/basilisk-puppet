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

    file { '/etc/samba/smb.conf':
        source  => 'puppet:///modules/smbd/smb.conf',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['samba'],
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
