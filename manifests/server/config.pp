class plmce::server::config {

        $mysqlserverid = $plmce::mysqlserverid
        $mysqldistro   = $plmce::mysqldistro
        $mysql_ver     = $plmce::mysql_ver

        info("mysqlserverid = $mysqlserverid") 
        case $::osfamily {
          'RedHat': {
               $my_file="/etc/my.cnf"
               if $mysql_ver == "57" {
		   notify "Disabling my old friend selinux for 5.7"
		   exec {
			"disable-selinux":
			    path    => ["/usr/bin", "/bin"],
			    command => "echo 0 >/selinux/enforce",
			    unless  => "grep 0 /selinux/enforce",
                   }
               }
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

	if $mysql_ver == "57" {
           case $::osfamily {
               'RedHat': {
	           file {
		       "/etc/init.d/mysqld":
			   ensure => present,
                           source => "puppet:///modules/plmce/mysqld-57",
			   mode   => 755;
                   }
               }
               'Debian': {
 		  # nothing here yet
               }
           }
        }
}
