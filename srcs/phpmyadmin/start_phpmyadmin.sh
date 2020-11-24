/usr/sbin/php-fpm7 -F 
nginx -g 'daemon off;
/usr/bin/supervisord -c /etc/supervisord.conf