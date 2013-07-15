# -*- mode: ruby -*-
# vi: set ft=ruby :

node default {
  
  
  
  service { "iptables":
    enable => false,
    ensure => stopped,
  }

  include pxc_talk

}


node node1 inherits default {
  
  exec { "wget http://downloads.mysql.com/docs/sakila-db.tar.gz":
    cwd     => "/opt",
    creates => "/opt/sakila-db.tar.gz",
    path    => ["/usr/bin", "/usr/sbin"]
  }
}

