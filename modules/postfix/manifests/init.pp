class postfix {
    package {
        'postfix': ensure => installed;
    }

    file { '/etc/postfix/master.cf':
        source  => 'puppet:///modules/postfix/master.cf',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['postfix'],
    }

    service { 'postfix':
        enable    => true,
        ensure    => running,
        require   => [ Package['postfix'],
                       File['/etc/postfix/master.cf'] ],
        subscribe => File['/etc/postfix/master.cf'],
    }
}
