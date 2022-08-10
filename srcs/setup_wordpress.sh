#! /bin/bash/

# Download the latest WordPress
wget https://ru.wordpress.org/latest-ru_RU.tar.gz > /dev/null

# Untar the downloaded WordPress' file
tar xfz latest-ru_RU.tar.gz > /dev/null

# Remove the tar file
rm -f latest-ru_RU.tar.gz

# Create a config file based on the given sample
cp wordpress/wp-config-sample.php wordpress/wp-config.php

# Edit the config file using sed app
#	Set the name of the database for WordPress
sed -i "s/database_name_here/$1/" wordpress/wp-config.php

#	Set MySQL database username
sed -i "s/username_here/$2/" wordpress/wp-config.php

#	Set MySQL database password
sed -i "s/password_here/$3/" wordpress/wp-config.php

# Move WordPress to localhost
mv -f wordpress /var/www/localhost/wordpress
