#!/bin/bash

# Wait that mysql was up
until mysql
do
	echo "NO_UP"
done

echo "CREATE DATABASE wordpress" | mysql -u root
echo "CREATE USER 'user'@'%' IDENTIFIED BY 'password';" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'user'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES" | mysql -u root
mysql -u root wordpress < wordpress.sql

sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
/usr/bin/mysql_install_db --user=root --datadir="/var/lib/mysql"
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
