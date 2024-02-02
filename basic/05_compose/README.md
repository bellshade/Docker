## Docker Compose
![banner](../../.github/assets/docker-compose.png)
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
# version untuk saat ini ialah version 3.9 
# untuk installasi kalian bisa jalanin saja script di root folder ini `install.sh`
version: '3.9'
# services define apa saja yang akan dilakukan build 
# bahkan sampai pembuatan container dan running juga
services:

  # ini adalah service webapp, kalian bebas custom sesuai keinginan kalian
  webapp:

    # ini image yang ingin digunakan kedalam service ini
    # semua tergantung kebutuhan, disini saya kasih contoh nginx
    image: nginx
    
    # nama container , sebenarnya biar mudah saja di kelola
    # karena secara default docker sudah membuat nama container secara otomatis
    container_name: webapp

    # env, ini tergantung setiap image, ada env yang penting beberapa image
    # seperti database yang butuh env password, user, dan default db name
    # namun disini cuma contoh saja 
    environment:
      - OWNER=Bellshade
      - LINK_GITHUB=https://github.com/bellshade/Docker
    
    # publisher port yang dimana ini akan digunakan untuk lient akses ke container kita
    # port yang image bisa kalian baca di official docsnya
    ports:
      - 4000:80
```
Setelah kalian buat kalian bisa running langsung dengan cara `docker-compose up -d`. Flag `-d` digunakan untuk running in background
```bash
$ docker-compose up -d
```

Kalau kalian punya dockerfile sendiri dan ingin building serta buat containernya kalian bisa tambahkan syntax `build` dan setup file serta path isi dari Dockerfilenya. 
```yml
# version untuk saat ini ialah version 3.9 
# untuk installasi kalian bisa jalanin saja script di root folder ini `install.sh`
version: '3.9'
# services define apa saja yang akan dilakukan build 
# bahkan sampai pembuatan container dan running juga
services:
  
  # ini dia service yang sering digunakan
  # jika kalina punya image yang siap di build
  # compose support  bagi kalian yang punya config-an sendiri
  custom_image:

    # build disini tandanya dia akan melakukan buuld image
    build:
      # context digunakan untuk execution path
      # mayoritas langsung . karena langsung di build disitu
      context: .

      # dockerfile ini bisa disesuaikan tempat configan kalian
      dockerfile: Dockerfile
    container_name: custom_image
    ports:
      - 8000:8080
    networks:
      - connection
```

## Depends On
Depends On sering digunakan jika kalian membutuhkan service lain. Sebagai contohnya misal disini saya ingin build container dengan image `nginx` saya membutuhkan database postgres. Maka dari itu kita bisa menggunakan `depends_on` contoh sample compose nya seperti ini

```yml
# version untuk saat ini ialah version 3.9 
# untuk installasi kalian bisa jalanin saja script di root folder ini `install.sh`
version: '3.9'
# services define apa saja yang akan dilakukan build 
# bahkan sampai pembuatan container dan running juga
services:

  # ini adalah service webapp, kalian bebas custom sesuai keinginan kalian
  webapp:

    # ini image yang ingin digunakan kedalam service ini
    # semua tergantung kebutuhan, disini saya kasih contoh nginx
    image: nginx
    
    # nama container , sebenarnya biar mudah saja di kelola
    # karena secara default docker sudah membuat nama container secara otomatis
    container_name: webapp

    # env, ini tergantung setiap image, ada env yang penting beberapa image
    # seperti database yang butuh env password, user, dan default db name
    # namun disini cuma contoh saja 
    environment:
      - OWNER=Bellshade
      - LINK_GITHUB=https://github.com/bellshade/Docker
    
    # publisher port yang dimana ini akan digunakan untuk lient akses ke container kita
    # port yang image bisa kalian baca di official docsnya
    ports:
      - 4000:80
    
    # depends_on tandanya ia linked ke db
    # dimana setiap data nya akan bisa diakses oleh service webapp
    # bahkan sampai hostnamenya juga bisa digunakan
    # usecase ini sering terjadi jika punya app berbasis statefull
    depends_on:
      - db

    # networks ini digunakan untuk semua service yang ada memiliki segment yang sama
    # setiap network punya driver nya masing masing 
    # next kita bahas ini
    networks:
      - connection
    
  db:

    # seperti biasa ini tergantung kebutuhan
    # sesuaikan dengan kemauan kalian
    # tujuan di kustomisasi agar mudah di kelola oleh team kalian
    image: postgres:alpine
    container_name: dbapp

    # ini env yang penting
    # karena ada di official docsnya 
    # kalian bisa baca tergantung imagenya, misal disini postgres, kalian bisa baca di sini :
    # https://hub.docker.com/_/postgres
    environment:
      - POSTGRES_USER=bellshade
      - POSTGRES_PASSWORD=bellshade
      - POSTGRES_DB=simpletest
    
    # oya kalian bisa custom hostnya sesuka kalian
    # disini tujuannya agar allow siapa yang bisa query ke container
    # misal disini hanya localhost saja yang diperbolehkan query
    # jadi ip manapun tidak akan bisa query
    ports:
      - "127.0.0.1:5432:5432"
    networks:
      - connection
  
  # ini dia service yang sering digunakan
  # jika kalina punya image yang siap di build
  # compose support  bagi kalian yang punya config-an sendiri
  custom_image:

    # build disini tandanya dia akan melakukan buuld image
    build:
      # context digunakan untuk execution path
      # mayoritas langsung . karena langsung di build disitu
      context: .

      # dockerfile ini bisa disesuaikan tempat configan kalian
      dockerfile: Dockerfile
    container_name: custom_image
    ports:
      - 8000:8080
    networks:
      - connection

# disini proses buat networks dengan nama connection
# driver yang digunakan ialah bridge
# agar ketikanya bisa sharing data dan punya segment yang sama
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