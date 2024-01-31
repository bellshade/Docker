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