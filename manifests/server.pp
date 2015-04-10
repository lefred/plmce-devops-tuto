class plmce::server {
    include plmce::server::packages
    include plmce::server::config
    include plmce::server::service

   Plmce::Server::Config->Plmce::Server::Service
}
