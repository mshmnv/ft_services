rc default
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -u root mysql < create_db
# echo "CREATE DATABASE data_base;" | mysql -u root
# echo "CREATE USER 'user'@'%' IDENTIFIED BY 'password';" | mysql -u root
# echo "GRANT ALL ON data_base.* TO 'user'@'%' WITH GRANT OPTION;" | mysql -u root
# echo "FLUSH PRIVILEGES;" | mysql -u root

mysql -u root data_base < data_base.sql

rc-service mariadb stop
/usr/bin/mysqld_safe