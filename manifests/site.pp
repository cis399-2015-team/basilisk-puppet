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
    include httpd
}

node ip-10-0-3-110 {
    include sshd
}
