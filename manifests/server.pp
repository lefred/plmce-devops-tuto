class plmce::server {
    include plmce::server::packages
    include plmce::server::service
    include plmce::server::config
class mysql::server inherits plmce::server {
   info("in MySQL server class")
}
}


