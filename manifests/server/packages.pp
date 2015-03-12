class plmce::server::packages {
  
      case $plmce::mysqldistro {
        'community': {
            $packs = ["mysql-community-server", 
                      "mysql-community-client", 
                      "mysql-community-libs-compat"]
            $mysql_bin = "mysqld"
        }
        'mariadb': {
            $packs = ["MariaDB-server",
                      "MariaDB-client",
                      "MariaDB-compat"]
            $mysql_bin = "mysql"
        }
        'webscalesql': {
            $packs = ["webscalesql-server", 
                      "webscalesql-client"] 
            $mysql_bin = "mysqld"
        }
        'percona': {
            $packs = ["Percona-Server-server-${plmce::mysql_ver}", 
                      "Percona-Server-client-${plmce::mysql_ver}"]
            $mysql_bin = "mysql"
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
      package {
         $packs:
            require => $require,
            ensure  => "installed";
      }
} 
