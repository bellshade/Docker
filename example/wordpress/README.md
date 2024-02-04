## Miniserver
Project ini ialah tentang miniserver dimana didalam imagenya terdiri wordpress, phpmyadmin, dan juga database mysql. Project ini hanya sekedar untuk belajar saja. Pada kenyataanya nanti ketika memakai docker tiap service itu akan dipisah dan tidak ada dalam satu image. Karena docker emang di didesign seperti itu

## Setup Project
Untuk itu kalian harus ubah beberapa hal yang kalian ubah :
- ./assets/database.sql, ubah bagian database dan user untuk pembuatan user
```sql
create database example_db;
create user 'admin'@'localhost' identified by 'ExamplePassword';
```
- Edit ./assets/wp-config.php untuk ubah database dan user yang udah disetup
```php
define( 'DB_NAME', 'example-db' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'ExamplePassword' );
```

## Install Project
Setelah kalian sudah selesai setup kalian bisa langsung build imagenya, dan beberapa hal yang harus kalian ikuti
```
docker build -t bellshade/miniserver .
```

Setelah sudah dibuild lalu kalian bisa running containernya dengan cara seperti ini
```
$ docker run --rm -d -p 80:80 -p 3306:3306 --name=sample-miniserver bellshade/miniserver
```

Berhubung ini ada database maka kalian harus start database itu sendiri dengan cara
```
$ docker exec -d sample-miniserver /etc/init.d/mariadb start
```