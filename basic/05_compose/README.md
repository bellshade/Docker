## Docker Compose
Compose merupakan skema script yang sering digunakan untuk build container, build image, running container, dan stop container. Compose mempermudah kita untuk deploy beberapa container dalam satu waktu. Ada beberapa hal yang harus diketahui untuk setup docker compose. Untuk format sebuah file docker compose yaitu `docker-compose.yml`.

| Statement      | Description                                                   |
|----------------|---------------------------------------------------------------|
| version        | version untuk docker-compose sendiri, untuk saat ini udah 3.9 |
| services       | define services yang akan di build containernya               |
| image          | untuk define image yang ingin digunakan                       |
| container_name | untuk define nama container nya                               |
| ports          | untuk define port yang ingin dipublish keluar                 |
| build          | statement untuk build image                                   |
| context        | folder yang berisi Dockerfile                                 |
| dockerfile     | nama file Dockerfilenya                                       |
| env_file       | file environtment untuk di passing ke container               |
| environtments  | setup env secara manual berbeda dengan env_file               |
| volume         | setup volume untuk backup data dari container ke local server |
| networks       | setup network yang ingin digunakan                            |

Diatas adalah statement penting yang sering digunakan untuk deployment, docker sendiri sebenarnya masih banyak statement yang bisa digunakan seperti `depends_on` sebagai media untuk interaksi antar service. Biasanya sering digunakan untuk terhubung antara aplikasi dan database yang kita punya

## Up Compose
Cara buat file compose sebenarnya mudah dengan `docker-compose.yml` , terus kalian bisa setup sesuai kemauan kalian. Contohnya seperti disini saya udah setup docker-compose saya seperti dibawah ini.

```yml
version: '3.9'
services:
  webapp:
    image: nginx
    container_name: webapp
    ports:
      - 4000:80
```
Setelah kalian buat kalian bisa running langsung dengan cara `docker-compose up -d`. Flag `-d` digunakan untuk running in background
```bash
$ docker-compose up -d
```

Kalau kalian punya dockerfile sendiri dan ingin building serta buat containernya kalian bisa tambahkan syntax `build` dan setup file serta path isi dari Dockerfilenya. 
```yml
version: '3.9'
services:
  custom_image:
    build:
      context: .
      dockerfile: Dockerfile
    container_name: custom_image
    ports:
      - 8000:8080
```

## Depends On
Depends On sering digunakan jika kalian membutuhkan service lain. Sebagai contohnya misal disini saya ingin build container dengan image `nginx` saya membutuhkan database postgres. Maka dari itu kita bisa menggunakan `depends_on` contoh sample compose nya seperti ini

```yml
version: '3.9'
services:
  webapp:
    image: nginx
    container_name: webapp
    environment:
      - OWNER=Bellshade
      - LINK_GITHUB=https://github.com/bellshade/Docker
    ports:
      - 4000:80
    depends_on:
      - db
    networks:
      - connection
    
  db:
    image: postgres:alpine
    container_name: dbapp
    environment:
      - POSTGRES_USER=bellshade
      - POSTGRES_PASSWORD=bellshade
      - POSTGRES_DB=simpletest
    ports:
      - "127.0.0.1:5432:5432"
    networks:
      - connection

networks:
  connection:
    driver: bridge
```

Oya jika kalian menggunakan `depends_on` sangat disarankan setup network sendiri , karena dengan ini setiap service memiliki ip address dengan segment yang sama. Setiap networks yang diatur memiliki type `driver` yang berbeda, ada yang bridge yang biasanya digunakan untuk forward data antar segment. Selain bridge ada juga seperti `overlay`, `host`, `IPvlan`, dan `Macvlan`

## Down Compose
Ketika kalian up compose, kalian bisa down semua container yang udah kalian setup di `docker-compose` hal ini sering dilakukan ketika lagi ada bug. Karena kalau di drop secara manual kan lama, nah ini kita bisa down semua container yang running dengan catatan itu ada di setup compose kita. Caranya kalian bisa dengan command seperti ini
```bash
$ docker-compose down
```