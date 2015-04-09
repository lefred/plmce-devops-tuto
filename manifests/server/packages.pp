class plmce::server::packages {
  
      case $plmce::mysqldistro {
        'community': {
            $packs = ["mysql-community-server", 
                      "mysql-community-client", 
                     ]
            $mysql_bin = "mysqld"
        }
        'mariadb': {
            $packs = ["MariaDB-server",
                      "MariaDB-client",
                     ]
            $mysql_bin = "mysql"
        }
        'webscalesql': {
            $packs = ["webscalesql-server", 
                      "webscalesql-client"] 
            $mysql_bin = "mysqld"
        }
        'percona': {
            case $::osfamily {
               'RedHat': {
                  $packs = ["Percona-Server-server-${plmce::mysql_ver}", 
                            "Percona-Server-client-${plmce::mysql_ver}"]
                  $mysql_bin = "mysqld"
               }
               'Debian': {
                  $packs = ["percona-server-server-${plmce::mysqlversion}", 
                            "percona-server-client-${plmce::mysqlversion}"]
                  $mysql_bin = "mysql"
               }
            }
        }


      }
   

      case $::osfamily {
          'RedHat': {
              $require = Yumrepo['mysql-repo']
          }
          'Debian': {
              $require = Apt::Source['mysql-repo']
          }
      }
      info("packages : ${plmce::ensure}")
      package {
         $packs:
            require => $require,
            ensure  => $plmce::ensure;
      }
} 
