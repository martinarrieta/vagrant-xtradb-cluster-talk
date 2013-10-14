#/bin/sh

# Download and store the rpm's under "modules/ndbcluster/files/rpms"

packages="server shared client"

baseurl="http://www.percona.com/redir/downloads/Percona-XtraDB-Cluster/"

version="5.5.33-23.7.6"

mkdir -p modules/pxc_talk/files/rpms

cd modules/pxc_talk/files/rpms

wget -c $baseurl/$version/RPM/rhel6/x86_64/Percona-XtraDB-Cluster-galera-2.7-1.157.rhel6.x86_64.rpm

wget -c http://dl.fedoraproject.org/pub/epel/6Server/x86_64/socat-1.7.2.2-1.el6.x86_64.rpm


for i in $packages; do
	wget -c $baseurl/$version/RPM/rhel6/x86_64/Percona-XtraDB-Cluster-$i-$version.495.rhel6.x86_64.rpm
done
