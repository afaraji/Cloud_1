#!/bin/sh

# false
# while [ $? -ne 0 ]
# do
# 	sleep 1
# 	wp plugin install redis-cache --activate --path='/var/www/html' --allow-root
# done

# wp redis enable --path='/var/www/html' --allow-root


# activate theme
false
while [ $? -ne 0 ]
do
	sleep 1
	wp theme activate twentytwentyone --path='/var/www/html' --allow-root
done

# add '<?php $ip_server = $_SERVER['SERVER_ADDR']; echo "Server IP Address is: $ip_server"; ?>'
# to /var/www/html/wp-content/themes/twentytwentyone/header.php
# cat <<EOF  >> /var/www/html/wp-content/themes/twentytwentyone/header.php
# <?php
#     \$ip_server = \$_SERVER["SERVER_ADDR"];
#     echo "<h3 style=\"text-align: center;\">Server IP Address is: <span style=\"color: red\">\$ip_server</span></h3>";
# ?>
# EOF
FILE='/var/www/html/wp-content/themes/twentytwentyone/header.php'

if [ $(cat $FILE | grep "Server IP Address is" | wc -l) -lt 1 ]; then
    
    echo '<?php
        $ip_server = $_SERVER["SERVER_ADDR"];
        echo "<h3 style=\"text-align: center;\">Server IP Address is: <span style=\"color: red\">$ip_server</span></h3>";
    ?>' >> $FILE
fi

sed -i 's/<WP_PORT>/'"${WP_PORT}"'/g' /etc/php7/php-fpm.d/www.conf
sed -i 's/<WP_N>/'"${WP_N}"'/g' /etc/php7/php-fpm.d/www.conf
# chmod 777 -R /var/www/html/wp-content/themes/*

php-fpm7 -F
