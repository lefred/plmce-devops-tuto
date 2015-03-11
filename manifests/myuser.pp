class plmce::myuser {

  $myusers = hiera('plmce::user', {})
  info($myusers)
  #create_resources('mysql_user', $myusers)

}
