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

    file { '/home/ubuntu/website':
        ensure  => 'directory',
        mode    => 644,
        owner   => ubuntu,
        group   => ubuntu,
    }

    mount { '/home/ubuntu/website':
        device  => '//10.0.3.20/website',
        fstype  => 'cifs',
    	ensure  => 'unmounted',
    	options => 'username=ubuntu,noexec,sec=ntlmv2',
        atboot  => 'true',
    }
}
