#/bin/sh

# Download and store the rpm's under "modules/ndbcluster/files/rpms"

packages="server shared client"

baseurl="http://www.percona.com/redir/downloads/Percona-XtraDB-Cluster/"

version="5.5.31-23.7.5"

mkdir -p modules/pxc_talk/files/rpms

cd modules/pxc_talk/files/rpms

wget $baseurl/$version/RPM/rhel6/x86_64/Percona-XtraDB-Cluster-galera-2.6-1.152.rhel6.x86_64.rpm

for i in $packages; do
	wget $baseurl/$version/RPM/rhel6/x86_64/Percona-XtraDB-Cluster-$i-$version.438.rhel6.x86_64.rpm
done
