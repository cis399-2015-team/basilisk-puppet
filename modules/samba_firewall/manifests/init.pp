class samba_firewall {
    resources { "firewall":
        purge => true
    }

    Firewall {
        before  => Class['samba_firewall::post'],
        require => Class['samba_firewall::pre'],
    }

    class { ['samba_firewall::pre', 'samba_firewall::post']: }

    class { 'firewall': }
}
