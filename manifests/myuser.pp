class plmce::myuser {

  $myusers = hiera('plmce::user', {})
  create_resources('plmce::user', $myusers)

}
