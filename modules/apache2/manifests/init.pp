class apache2 {
    package {
        'apache2': ensure => installed;
    }

    file { '/etc/apache2/apache2.conf':
        source  => 'puppet:///modules/apache2/apache2.conf',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['apache2'],
    }

    file { '/var/www/html/index.html':
        source  => 'puppet:///modules/apache2/index.html',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['apache2'],
    }

    service { 'apache2':
        enable    => true,
        ensure    => running,
        require   => [ Package['apache2'],
                       File['/etc/apache2/apache2.conf'],
                       File['/var/www/html/index.html']],
        subscribe => File['/etc/apache2/apache2.conf'],
    }
}
