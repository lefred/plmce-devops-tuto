class mysql::repository {
        
          info("We load our MySQL repo module")
          
          case $::osfamily {
            'RedHat' : {
               $releasever = $operatingsystemmajrelease
               $basearch   = $hardwaremodel
          
               yumrepo {
                  "mysql-repo":
                     descr    => "PLMCE MySQL repo",
                     enabled  => 1,
                     baseurl  => "http://repo.percona.com/centos/$releasever/os/$basearch/",
                     gpgcheck => 0;
               }
            }
            'Debian': {
               include ::apt
               
               apt::source {
                  "mysql-repo":
                     location   => "http://repo.percona.com/apt/",
                     release    => $lsbdistcodename,
                     repos      => "main",
                     key        => "1C4CBDCDCD2EFD2A",
                     key_source => "http://mirror.openminds.be/keys/1C4CBDCDCD2EFD2A.asc",
                     include_src => false
              }
            }  
          } 
} 
