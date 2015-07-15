class postfix {
    package {
        'postfix': ensure => installed;
    }

    package {
        'mailutils': ensure => installed;
    }

    file { '/etc/hosts':
        source  => 'puppet:///modules/postfix/hosts',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['postfix'],
    }

    file { '/etc/hostname':
        source  => 'puppet:///modules/postfix/hostname',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['postfix'],
    }

    file { '/etc/postfix/main.cf':
        source  => 'puppet:///modules/postfix/main.cf',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['postfix'],
    }

    service { 'postfix':
        enable    => true,
        ensure    => running,
        require   => [ Package['postfix'],
                       File['/etc/postfix/main.cf'],
                       File['/etc/hosts'],
                       File['/etc/hostname'] ],
        subscribe => File['/etc/postfix/main.cf'],
    }
}
