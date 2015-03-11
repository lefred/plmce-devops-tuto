class plmce::myuser {

  $myusers = hiera('plmce::user', {})
  create_resources('mysql_user', $myusers)

}
