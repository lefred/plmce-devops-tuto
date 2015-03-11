class plmce::server::service {

    service {
        "mysql":
            enable  => true,
            ensure  => running,
            require => Package[$plmce::server::packages::packs]
    }
}
