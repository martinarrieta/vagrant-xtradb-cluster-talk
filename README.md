Notes:


# Connect to node1

host> vagrant ssh node1

#Become root

node1> sudo -s 

#Create the default my.cnf file:

node1> cat /opt/notes/my.cnf-00 > /etc/my.cnf

#Add the default wsrep option to the my.cnf file

node1> cat /opt/notes/my.cnf-01 >> /etc/my.cnf

# Start the cluster

node1> /etc/init.d/mysql start --wsrep_cluster_address=gcomm://

# if you have 5.5.31-23.7.5 or newer 

node1> /etc/init.d/mysql bootstrap-pxc


# Create the MySQL user to make the SST.

node1> mysql -u root -e "GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'sst'@'localhost' IDENTIFIED BY 'secret'"


# Connect to node2

host> vagrant ssh node2

#Become root

node2> sudo -s 

#Create the default my.cnf file:

node2> cat /opt/notes/my.cnf-00 > /etc/my.cnf

#Add the default wsrep option to the my.cnf file

node2> cat /opt/notes/my.cnf-01 >> /etc/my.cnf

