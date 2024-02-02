## Apa itu Dockerfile ?
Dockerfile ialah skema script dari docker yang digunakan untuk build image dengan code yang telah kita memiliki. Didalam dockerfile ada beberapa statement yang penting ketika building docker image, berikut beberapa statement yang penting dalam building image di `Dockerfile`

| Statement  | Description                                                             |
|------------|-------------------------------------------------------------------------|
|    FROM    | statement yang digunakan untuk memanggil base image yang kita butuhkan  |
|   WORKDIR  | work directory / main directory yang ingin kita setup                   |
|     RUN    | running command didalam container                                       |
|    LABEL   | digunakan untuk labelin image misal Author, LICENSE, dsb                |
|     ADD    | add semua folder local dan file yang ada ke dalam container             |
|    COPY    | sama seperti `ADD` untuk copy local ke dalam container                  |
|     ARG    | atau argumen ini bisa digunakan untuk setup variabel                    |
|   EXPOSE   | port yang siap dipublish untuk public                                   |
| ENTRYPOINT | path yang digunakan untuk siap di execute dalam dockerfile              |
|     CMD    | shell yang digunakan untuk execute command ketika siap untuk di running |

Ketika kalian bundling image sangat disarankan untuk memperhatikan size imagenya. Karena semakin besar size imagenya semakin membutuhkan resource yang besar juga. Salah satu cara kalian untuk compress size image bisa menggunakan base image `alpine`. Banyak image yang sekarang udah support base `alpine`. Selain itu kalian bisa juga management resource yang kalian perlukan, tapi itu akan di materi berikutnya, stay tune aja :u

## Bundling Image
Bundling image bisa dengan cara seperti ini
```
docker build -t [tagVersion] .
```
Namun jika kalian punya nama file yang berbeda kalian bisa gunakan dengan cara ini. Untuk penamaan sangat disarankan seperti ini `Dockerfile.[envName]`
```
docker build -f [namaFile] -t [tagVersion] .
```
Nah ada banyak hal yang harus kalian perhatikan. Didalam `Dockerfile` sendiri kalian bebas untuk mengatur apapun yang kalian mau . Baik itu untuk base image, default directory, custom command , dan sebagainya. Karena docker sendiri sudah membuat sedemikian rupa agar app yang kita punya itu suatu saat masih bisa dipakai lagi untuk kedepannya. Misal, disini saya punya sample `Dockerfile` dengan base image `nginx`

```dockerfile
# FROM yang artinya base image
# Disini kalian bisa memanggil image sesuai kebutuhan kalian
FROM nginx

# ARG digunakan untuk memberikan default value untuk variabel
# Ini sering digunakan jika ada beberapa hal yang memiliki data sama
ARG SAMPLEARG=rulanugrh

# LABEL digunakan untuk custom labeling saja
# Biasanya berisi informasti tentang image itu sendiri
LABEL maintainer=${SAMPLEARG}

# WORKDIR ialah work directory yang akan bisa ketahuan 
# ketika kalian login kedalam container
# biasanya ini dilakukan untuk setup default directory dari image tersebut
WORKDIR /var/www/html

# COPY ialah command untuk copy dari local ke dalam image
# alias apapun itu akan langsung di copy ke dalam image
COPY . .

# EXPOSE yang digunakan untuk setup default value publisher port untuk keluar
EXPOSE 8080

# CMD digunakan untuk setup command ketika container running
CMD [ "nginx", "-g", "daemon off" ]
```