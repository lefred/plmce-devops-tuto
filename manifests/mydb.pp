class plmce::db {

  $mydbs = hiera('plmce::db', {})
  create_resources('mysql::db', $mydbs)

}
