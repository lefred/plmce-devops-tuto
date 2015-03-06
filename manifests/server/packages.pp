class mysql::server::packages {
   
      package {
         "Percona-Server-server-56":
            require => Yumrepo['mysql-repo'],
            ensure  => "installed";
      }
   
} 
