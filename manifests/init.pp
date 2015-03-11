class plmce ($mysqlserverid=undef, $mysqldistro="percona", $mysqlversion="5.6") {
      info("We load our MySQL module")
      if $plmce::mysqlversion == "5.7" and $plmce::mysqldistro == "community" {
          info("You are brave ! It's nice to test 5.7 !")
          $mysql_ver="57"
      } elsif $plmce::mysqlversion == "10.1" and $plmce::mysqldistro == "mariadb" {
          info("MariaDB 10.1 is full of new features, good tests !")
          $mysql_ver="10.1"
      } elsif $plmce::mysqlversion == "5.6" and ($plmce::myqldistro == "community" or $plmce::mysqldistro == "percona") {
          info("Congratulations ! You are using a stable version of MySQL ($plmce::mysqlversion)")
      } elsif $plmce::mysqlversion == "10.0" and $plmce::mysqldistro == "mariadb" {
          info("Congratulations ! You are using a stable version of MariaDB ($plmce::mysqlversion)")
      } elsif $plmce::mysqlversion == "5.5" {
          info("You are conservative !")
      } elsif $plmce::mysqlversion == "5.3" and $plmce::mysqldistro == "mariadb" {
          info("This is an old version of MariaDB :-(")
      } else {
          fail("This version ($plmce::mysqlversion) and this distro ($plmce::mysqldistro) are not compatible !")
      }
      include plmce::repository
      include plmce::config
}       

