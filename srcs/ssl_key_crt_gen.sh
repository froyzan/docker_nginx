#! /bin/bash/

# Create a new Self-Signed SSL Certificate, use the openssl req command

#	-newkey rsa:4096 - Creates a new certificate request and 4096 bit RSA key.
#		The default one is 2048 bits
#	-x509 - Creates a X.509 Certificate
#	-sha256 - Use 265-bit SHA (Secure Hash Algorithm)
#	-days 3650 - The number of days to certify the certificate is ten years
#	-nodes - Creates a key without a passphrase
#	-out example.crt - Specifies the filename of the certificate to create
#	-keyout example.key - Specifies the filename of the private key to create
#	-subj - For configuration
#		-C= - Country name. The two-letter ISO abbreviation
#		-ST= - State or Province name
#		-L= - Locality Name. The name of the city where you are located
#		-O= - The full name of your organization
#		-OU= - Organizational Unit
#		-CN= - The fully qualified domain name
openssl req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 365 \
            -nodes \
            -out /etc/ssl/private/nginx_selfsigned.crt \
            -keyout /etc/ssl/private/nginx_selfsigned.key \
			-subj "/C=RU/ST=Moscow/L=Moscow/O=school_21/OU=psafflow/CN=localhost"
