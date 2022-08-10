#! /bin/bash/

# Use the wget command to retrieve the latest stable version of phpMyAdmin
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz

# To verify the GPG key for phpMyAdmin, download the phpMyAdmin keyring
wget https://files.phpmyadmin.net/phpmyadmin.keyring

# Import the keyring
gpg --import phpmyadmin.keyring

# Download the corresponding GPG .asc file for your version of phpMyAdmin
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz.asc

# Verify the .asc file against the keyring downloaded
gpg --verify phpMyAdmin-latest-all-languages.tar.gz.asc

# Remove the GPG key for phpMyAdmind and the GPG .asc file 
rm -f phpmyadmin.keyring phpMyAdmin-latest-all-languages.tar.gz.asc

# Unpack the phpMyAdmin tar.gz files
tar xvf phpMyAdmin-latest-all-languages.tar.gz > /dev/null

# Remove the tar.gz file
rm -f phpMyAdmin-latest-all-languages.tar.gz

# Rename the phpmyadmin file
mv -f phpMyAdmin* phpmyadmin

# Create a default configuration file
cp phpmyadmin/config.sample.inc.php phpmyadmin/config.inc.php

# Edit the default configuration file with sed app
sed -i "s/blowfish_secret'] = ''/blowfish_secret'] = '$1'/1" \
			phpmyadmin/config.inc.php

# Move phpmyadmin to localhost
mv -f phpmyadmin /var/www/localhost/phpmyadmin

#	https://phoenixnap.com/kb/how-to-install-phpmyadmin-on-debian-10
