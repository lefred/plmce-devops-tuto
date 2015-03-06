class mysql::server::packages {
   

      case $::osfamily {
          'RedHat': {
              $require = Yumrepo['mysql-repo']
          }
          'Debian': {
              $require = Apt::Source['mysql-repo']
          }
      }
      package {
         "Percona-Server-server-56":
            require => $require,
            ensure  => "installed";
      }
} 
