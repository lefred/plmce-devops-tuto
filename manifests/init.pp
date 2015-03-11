class plmce ($mysqlserverid=undef) {
      info("We load our MySQL module")
      include plmce::repository
      include plmce::config
}       

