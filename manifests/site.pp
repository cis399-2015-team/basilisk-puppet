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
    include samba
    include samba_firewall
}

node ip-10-0-3-110 {
    include sshd
    include postfix
    include apache2
    include smbclient
    include samba_firewall
}
