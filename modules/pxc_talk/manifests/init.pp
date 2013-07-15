
class pxc_talk( ) {

  $releasever = "6"
  $basearch = $hardwaremodel
  $extension = "rhel$releasever.$basearch.rpm"
  
  $version="5.5.31-23.7.5"
  
  
	yumrepo { 
    "percona":
      descr       => "Percona",
      enabled     => 1,
      baseurl     => "http://repo.percona.com/centos/$releasever/os/$basearch/",
      gpgcheck    => 0;
	}
  
  Packages {
    ensure => 'installed',
  }
  
  package {
    'percona-xtrabackup':
      ensure => 'installed',
  }
  
  file {
    'Percona-XtraDB-Cluster-shared':
      path=> "/var/cache/yum/x86_64/6/percona/packages/Percona-XtraDB-Cluster-shared-$version.438.$extension",
      source => "puppet:///pxc_talk/rpms/Percona-XtraDB-Cluster-shared-$version.438.$extension",
      require => Package['percona-xtrabackup'];
    'Percona-XtraDB-Cluster-client':
      path=> "/var/cache/yum/x86_64/6/percona/packages/Percona-XtraDB-Cluster-client-$version.438.$extension",
      source => "puppet:///pxc_talk/rpms/Percona-XtraDB-Cluster-client-$version.438.$extension",
      require => Package['percona-xtrabackup'];
    'Percona-XtraDB-Cluster-server':
      path=> "/var/cache/yum/x86_64/6/percona/packages/Percona-XtraDB-Cluster-server-$version.438.$extension",
      source => "puppet:///pxc_talk/rpms/Percona-XtraDB-Cluster-server-$version.438.$extension",
      require => Package['percona-xtrabackup'];
  } 
  
  
 
   
  package {
    'Percona-XtraDB-Cluster-shared':
    require => File['Percona-XtraDB-Cluster-shared'];
    'Percona-XtraDB-Cluster-client':
    require => File['Percona-XtraDB-Cluster-client'];
    'Percona-XtraDB-Cluster-server':
    require => File['Percona-XtraDB-Cluster-server'];
    
  }
  
  file {
    "/opt/notes":
    ensure => 'directory'
  }
  
  file { "my.cnf-00":
    path    => '/opt/notes/my.cnf-00',
    ensure  => file,
    require => File['/opt/notes'],
    content => template("pxc_talk/my.cnf-00.erb"),
  }
  
  file { "my.cnf-01":
    path    => '/opt/notes/my.cnf-01',
    ensure  => file,
    require => File['/opt/notes'],
    content => template("pxc_talk/my.cnf-01.erb"),
  }
  
}