class privileges {
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
