class sudo {
    conf { 'admin':
        ensure  => present,
        content => '%admin ALL=(ALL) ALL',
    }

    conf { 'samba':
        ensure  => present,
        content => '%samba ALL=(ALL) /bin/mount,/bin/umount,/sbin/mount.cifs,/sbin/umount.cifs',
    }

    conf { 'sudo':
        ensure  => present,
        content => '%sudo ALL=(ALL:ALL) ALL',
    }
}
