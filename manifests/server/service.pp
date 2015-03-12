class plmce::server::service {

    service {
        "mysql":
            enable  => true,
            name    => $plmce::server::packages::mysql_bin,
            ensure  => running,
            require => Package[$plmce::server::packages::packs]
    }
}
