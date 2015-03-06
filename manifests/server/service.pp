class mysql::server::service {

    service {
        "mysql":
            enable  => true,
            ensure  => running,
            require => Package[$mysql::server::packages::packs]
    }
}
