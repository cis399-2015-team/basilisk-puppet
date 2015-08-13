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

    file { '/home/ubuntu/www/':
        ensure  => 'directory',
        mode    => 755,
        owner   => ubuntu,
        group   => ubuntu,
        require => Package['apache2'],
    }

    file { '/home/ubuntu/www/html':
        ensure  => 'directory',
        mode    => 755,
        owner   => ubuntu,
        group   => ubuntu,
        require => Package['apache2'],
        require => File ['/home/ubuntu/www']
    }

    file { '/home/ubuntu/www/html/index.html':
        source  => 'puppet:///modules/apache2/index.html',
        mode    => 644,
        owner   => ubuntu,
        group   => ubuntu,
        require => Package['apache2'],
    }

    file { '/home/ubuntu/www/html/dino-riders.jpg':
        source  => 'puppet:///modules/apache2/dino-riders.jpg',
        mode    => 644,
        owner   => ubuntu,
        group   => ubuntu,
        require => Package['apache2'],
    }

    service { 'apache2':
        enable    => true,
        ensure    => running,
        require   => [ Package['apache2'],
                       File['/etc/apache2/apache2.conf'],
                       File['/home/ubuntu/www'],
                       File['/home/ubuntu/www/html'],
                       File['/home/ubuntu/www/html/index.html'],
                       File['/home/ubuntu/www/html/dino-riders.jpg'] ],
        subscribe => File['/etc/apache2/apache2.conf'],
    }
}
