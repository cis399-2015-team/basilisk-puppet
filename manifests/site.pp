node ip-10-0-3-42 {
    cron { "puppet update":
	    command => "cd /etc/puppet && git pull -q origin master",
	    user    => root,
	    minute  => "*/5",
	}

    include sshd
}

node ip-10-0-3-20 {
    include sshd
    include apache2
    include smbd
}

node ip-10-0-3-110 {
    include sshd
    include postfix
    include apache2
    include smbclient

    class { 'sudo': }
    sudo::conf { 'admin':
        ensure  => present,
        content => '%admin ALL=(ALL) ALL',
    }

    sudo::conf { 'samba':
        ensure  => present,
        content => '%samba ALL=(ALL) /bin/mount,/bin/umount,/sbin/mount.cifs,/sbin/umount.cifs',
    }

    sudo::conf { 'sudo':
        ensure  => present,
        content => '%sudo ALL=(ALL:ALL) ALL',
    }
}
