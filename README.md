NOTES
=====


Setup the environment
=====================

Requirements
------------

* git http://git-scm.com/ 
* VirtualBox https://www.virtualbox.org Please do NOT use the vesion 4.2.14 becuause of "https://www.virtualbox.org/ticket/11895". It sholud be fixed on 4.2.16
* Vagrant http://www.vagrantup.com


Installation
------------

	host> git clone https://github.com/martinarrieta/vagrant-xtradb-cluster-talk
	host> cd vagrant-xtradb-cluster-talk
	host> sh download_rpms.sh
	host> vagrant up

If you have any problem with this initial setup, please open a new issue on this URL: https://github.com/martinarrieta/vagrant-xtradb-cluster-talk/issues

Node1
-----

Connect to node1

	host> vagrant ssh node1

Become root

	node1> sudo -s 

Create the default my.cnf file:

	node1> cat /opt/notes/my.cnf-00 > /etc/my.cnf

Add the default wsrep option to the my.cnf file

	node1> cat /opt/notes/my.cnf-01 >> /etc/my.cnf

Start the cluster

	node1> /etc/init.d/mysql start --wsrep_cluster_address=gcomm://
	# if you have 5.5.31-23.7.5 or newer 
	node1> /etc/init.d/mysql bootstrap-pxc


Create the MySQL user to make the SST.

	node1> mysql -u root -e "GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'sst'@'localhost' IDENTIFIED BY 'secret'"


Node2
-----

Connect to node2

	host> vagrant ssh node2

Become root

	node2> sudo -s 

Create the default my.cnf file:

	node2> cat /opt/notes/my.cnf-00 > /etc/my.cnf

Add the default wsrep option to the my.cnf file

	node2> cat /opt/notes/my.cnf-01 >> /etc/my.cnf


Node3
-----

Connect to node3

	host> vagrant ssh node3

Become root

	node3> sudo -s 

Create the default my.cnf file:

	node3> cat /opt/notes/my.cnf-00 > /etc/my.cnf

Add the default wsrep option to the my.cnf file

	node3> cat /opt/notes/my.cnf-01 >> /etc/my.cnf