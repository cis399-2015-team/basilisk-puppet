class sshd {
    package {
        'openssh-server': ensure => installed;
    }

    file { '/etc/ssh/sshd_config':
        source  => 'puppet:///modules/sshd/sshd_config',
        mode    => 644,
        owner   => root,
        group   => root,
        require => Package['openssh-server'],
    }

    service { 'ssh':
        enable    => true,
        ensure    => running,
        require   => [ Package['openssh-server'],
                       File['/etc/ssh/sshd_config'] ],
        subscribe => File['/etc/ssh/sshd_config'],
    }

    ssh_authorized_key { 'basilisk-hkhamm':
        user   => 'ubuntu',
        ensure => 'present',
        type   => 'ssh-rsa',
        key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC+FkO603ldTZD7EZEmOF7aQ8oyNK2uXgdsJappzpZhyv7+L4OfG//wEZNlIHKc/QDH0sYHZoBmDqB+hDmO5yfg9/7EjtckSomVVeqtMspK1co758ZTv6GopB+agRmPyeNI/uDq00MGquOr0H+Te8OjatvHIvBqu3JcEa8/pfCIbByNf7dZBdX8OI21oOgLfGhDkV3WZy0KG16V4gKW4QkzsAn2vR7+1ft7K5egZ2jZ97RGYaSM8IkzYd/DuM5FNUO6PFl9lvar2+Ew8j1E5sXUz0gvFyQyP5numNi2n7Ryf5e/29QeP5zw6s/l6zDH6Ns6uQzFEyuSqQ7u5igdXNOp',
    }

    ssh_authorized_key { 'basilisk-nhasson':
        user   => 'ubuntu',
        ensure => 'present',
        type   => 'ssh-rsa',
        key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDXXqPHGsCYmzeoF5+3/tq3SA4BFT4iKIDb8VyVQ123bSx2gXsK9h6dmYyv9Jn9LMEi0+DZ6/cc7lkGCcrrJVFM1PSTYtjVwwWobIilJYTjZFMCVXE6HFifxe0f3htwyXHDlR1sNRS8LfJXdYu7mN8/BLOlh76O/GfyY/GRnvwvft/S0uUcAm3x53FSRgSYo6q0ynR+yw9WX9OYimoWtIlsOOjLlWP+redeZmAkALdr9gquqyqWTU0dHdIPp3fHIJVtFZHpbye2OS79tyOMfzTCo4SH0lmfhAQlFAiheGkK1wbJ3/uIMpZVCLcJmbHsSg4M7P35z/ZO/gWzp6+ZNRTt',
    }

    ssh_authorized_key { 'stevev':
        user   => 'ubuntu',
        ensure => 'present',
        type   => 'ssh-rsa',
        key    => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCrFq80b0ptexNiI6KP4hxww5d5RFm8djIpsdJqRZDyoyD5vaf7d30bTLef8su6stHuBBjKccMcUjNyu4BliJBXIy7bKVDllVB5oeLFizDahQcgqjYfzyqj16uEa7NLBW5/3ljLpPX8XEI7YFM/hg65JFgpQIAiBi2N6bGj9mQrh/51SpCO6FruQH8KVjDl/CLgbnFq9cDwRDAo4tvPO1b0MRVrvM8BbZbBUHqV/093jVXkwY+BxsU6cgOnHrSmoTnH4MqMXUI/ok31JORVbWW5NAz28Ag7V/NbDvRBIYicJOd9aqEST/L812+tmnE8iQzn3bZvv7v0E7FHneCS5Qpz',
    }
}
