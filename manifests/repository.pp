class plmce::repository {
        
          info("We load our MySQL repo module")
          
          case $::osfamily {
            'RedHat' : {
               $releasever = $operatingsystemmajrelease
               $basearch   = $hardwaremodel
         
           
          if $plmce::mysqldistro == "community" {
              $repo_descr = "MySQL $plmce::mysqlversion Community Server"
              $repo_url   = "http://repo.mysql.com/yum/mysql-${plmce::mysqlversion}-community/el/$releasever/$basearch/"
          } elsif $plmce::mysqldistro == "mariadb" {
              $repo_descr = "MariaDB ${mysql_ver}"
              if $basearch == "x86_64" {
                  $mariaarch = "amd64"
              } else {
                  $mariaarch = "x86"
              }
              $repo_url   =  "http://yum.mariadb.org/${plmce::mysqlversion}/centos${releasever}-${mariaarch}/"
          } elsif $plmce::mysqldistro == "percona" {
              $repo_descr = "Percona"
              $repo_url   = "http://repo.percona.com/centos/$releasever/os/$basearch/"
          } elsif $plmce::mysqldistro == "webscalesql" {
              $repo_descr = "PSCE Repository"
              $repo_url   = "http://repo.psce.com/psce/yum/$releasever/$basearch/" 
          }
          
               yumrepo {
                  "mysql-repo":
                     descr    => $repo_descr,
                     enabled  => 1,
                     baseurl  => $repo_url,
                     gpgcheck => 0;
               }
            }
            'Debian': {
               include ::apt
 
               if $plmce::mysqldistro == "community" {
                 $repo_descr      = "MySQL $plmce::mysqlversion Community Server"
                 $repo_url        = "http://repo.mysql.com/apt/ubuntu/"
                 $repo_repos      = "mysql-${plmce::mysqlversion}"
                 $repo_release    = $lsbdistcodename
                 $repo_key        = "5072E1F5"
                 $repo_key_source = false
               } elsif $plmce::mysqldistro == "mariadb" {
                 $repo_descr      = "MariaDB ${mysql_ver}"
                 $repo_lsbdistid  = downcase($lsbdistid)
                 $repo_url        =  "http://mariadb.cu.be//repo/${plmce::mysqlversion}/${repo_lsbdistid}"
                 $repo_repos      = "main"
                 $repo_release    = $lsbdistcodename
                 $repo_key        = "0xcbcb082a1bb943db"
                 $repo_key_source = false
               } elsif  $plmce::mysqldistro == "percona" {
                 $repo_descr      = "Percona"
                 $repo_url        = "http://repo.percona.com/apt/"
                 $repo_repos      = "experimental"
                 $repo_release    = $lsbdistcodename
                 $repo_key        = "1C4CBDCDCD2EFD2A"
                 $repo_key_source = "http://mirror.openminds.be/keys/1C4CBDCDCD2EFD2A.asc"
               } elsif  $plmce::mysqldistro == "webscalesql" {
                 $repo_descr      = "PSCE Repository"
                 $repo_url        = "http://repo.psce.com/apt/"
                 $repo_repos      = "main"
                 $repo_release    = $lsbdistcodename
               } 
               

              
               apt::source {
                  "mysql-repo":
                     location   => $repo_url,
                     release    => $lsbdistcodename,
                     repos      => $repo_repos,
                     key        => $repo_key,
                     key_source => $repo_key_source,
                     include_src => false
              }
            }  
          } 
} 
