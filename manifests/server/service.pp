class mysql::server::service {

    service {
        "mysql":
            enable  => true,
            ensure  => running,
            require => Package['Percona-Server-server-56']
    }
}
