class plmce::server::config {

        $mysqlserverid = $plmce::mysqlserverid
        info("mysqlserverid = $mysqlserverid") 
        case $::osfamily {
          'RedHat': {
               $my_file="/etc/my.cnf"
          }
          'Debian': {
               $my_file="/etc/mysql/my.cnf"
          }
        }


        file {
                $my_file:
                        ensure  => present,
                        content => template("plmce/server/my.cnf.erb"),
                        notify  => Service['mysql']
        } 
}
