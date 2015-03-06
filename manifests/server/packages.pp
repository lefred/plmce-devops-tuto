class mysql::server::packages {
   

      case $::osfamily {
          'RedHat': {
              $require = Yumrepo['mysql-repo']
              $packs   = "Percona-Server-server-56" 
          }
          'Debian': {
              $require = Apt::Source['mysql-repo']
              $packs   = "percona-server-server-56" 
          }
      }
      package {
         $packs:
            require => $require,
            ensure  => "installed";
      }
} 
