class iptables {

	package {
		'iptables-persistent': ensure => true
	}

    file { '/usr/sbin/setiptables':
        source  => 'puppet:///modules/iptables/setiptables',
        mode    => 744,
        owner   => root,
        group   => root,
        notify  => Exec['run_script'],
        require => Package['iptables-persistent'],
    }

    exec { 'run_script':
    	command     => '/usr/sbin/setiptables',
    	refreshonly => true,
    }
}
