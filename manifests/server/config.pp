class mysql::server::config {

        $mysqlserverid = $mysql::mysqlserverid
        info ("mysqlserverid = $mysqlserverid") 
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
                        source  => "puppet:///modules/mysql/my.cnf",
                        notify  => Service['mysql']
        } 
}
