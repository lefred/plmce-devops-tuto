class plmce::server::packages {
  
      case $plmce::mysqldistro {
        'community': {
            $packs = ["mysql-community-server", 
                      "mysql-community-client", 
                     ]
        }
        'mariadb': {
            $packs = ["MariaDB-server",
                      "MariaDB-client",
                     ]
        }
        'webscalesql': {
            $packs = ["webscalesql-server", 
                      "webscalesql-client"] 
        }
        'percona': {
            case $::osfamily {
               'RedHat': {
                  $packs = ["Percona-Server-server-${plmce::mysql_ver}", 
                            "Percona-Server-client-${plmce::mysql_ver}"]
               }
               'Debian': {
                  $packs = ["percona-server-server-${plmce::mysqlversion}", 
                            "percona-server-client-${plmce::mysqlversion}"]
               }
            }
        }


      }
   

      case $::osfamily {
          'RedHat': {
              $require = Yumrepo['mysql-repo']
              $mysql_bin = "mysqld"
          }
          'Debian': {
              $require = Apt::Source['mysql-repo']
              $mysql_bin = "mysql"
          }
      }

      package {
         $packs:
            require => $require,
            ensure  => "installed";
      }
} 
