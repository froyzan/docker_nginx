# Create the image of the container
docker build -t ex_name_image .

# Run the container
docker run --name ex_name_container -p 80:80 -p 443:443 ex_name_image

phpMyAdmin Access URL : https://localhost/phpMyAdmin <br>
WordPress Access URL : https://localhost/wordpress
