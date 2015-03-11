class plmce::mydb {

  $mydbs = hiera('plmce::db', {})
  create_resources('plmce::db', $mydbs)

}
