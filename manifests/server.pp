class plmce::server {
    #include plmce::server::packages
    #include plmce::server::config
    #include plmce::server::service

    Class['plmce::server::config'] -> Class['plmce::server::service'] -> Class['plmce::sercer::service']
}
