# Wait that mysql was up
# until mysql
# do
# 	echo "NO_UP"
# done
# echo "CREATE DATABASE data_base;" | mysql -u root
# echo "CREATE USER 'user'@'%' IDENTIFIED BY 'password';" | mysql -u root
# echo "GRANT ALL ON data_base.* TO 'user'@'%' WITH GRANT OPTION;" | mysql -u root
# echo "FLUSH PRIVILEGES;" | mysql -u root

rc default
/etc/init.d/mariadb setup
rc-service mariadb start

# mysql -u root mysql < database
echo "CREATE DATABASE data_base;" | mysql -u root
echo "CREATE USER 'user'@'%' IDENTIFIED BY 'password';" | mysql -u root
echo "GRANT ALL ON data_base.* TO 'user'@'%' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mysql -u root data_base < wordpress.sql

rc-service mariadb stop
/usr/bin/mysqld_safe
# sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
# /usr/bin/mysql_install_db --user=root --datadir="/var/lib/mysql"
# /usr/bin/mysqld_safe --datadir="/var/lib/mysql"
