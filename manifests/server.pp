class mysql::server {
    include mysql::server::packages
    include mysql::server::service
    include mysql::server::config
}
