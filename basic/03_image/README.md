## Docker Image
Docker image merupakan aplikasi yang bisa kita gunakan secara bebas. Dengan adanya docker image kalian bebas mau pakai base image apa untuk membangun program kalian atau yang kalian butuhkan. Misal disini kita pengen running projek python , kita bisa menggunakan `image` python yang sudah tertera di docker hub. Oyaa, kalian bisa melihat semua image yang ada di [`Docker Hub`](https://hub.docker.com)

Selain itu kalian juga bisa push project kalian ke `docker hub`. Hal ini dilakukan agar suatu saat jika kalian butuh untuk running project itu kembali dan source code hilang, kalian bisa pull docker image nya saja dan otomatis bisa langsung di running

## Komponen Image
Didalam docker image ada beberapa hal yang harus kalian perhatikan yaitu `[REPOSITORY[:TAG]]` ini penting banget ketika kalian ingin menggunakan image ataupun publish sebuah image. Karena beda `TAG` itu juga mempengaruhi depedency yang available di docker imagenya. Setiap image yang ada itu memilik `IMAGE ID` yang dimana setiap `IMAGE ID` itu menyimpan cache imagenya dan setiap beda `TAG` juga pasti berbeda sizenya dan resource yang dibutuhkan juga berbeda

## Pull Image
Pull image secara simpelnya ini sama saja kaya kalian download package yang dibutuhkan, nah semua image yang ada tertera di [`Docker Hub`](https://hub.docker.com). Misal kalian butuh image python untuk running project kalian, kalian bisa langsung saja ke docker hub lalu mencari python dari tag yang kalian inginkan. Contoh disini saya butuh python versi 3.10 saya bisa langsung pull imagenya dengan cara seperti ini

```bash
$ docker pull python:3.10-alpine
```

## List Image
Jika kalian sudah pull image kalian bisa langsung lihat apakah image yang kalian pull sudah ada di local kalian
```bash
$ docker images
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
<none>                    <none>              77af4d6b9913        19 hours ago        1.089 GB
committ                   latest              b6fa739cedf5        19 hours ago        1.089 GB
python                    3.10-alpine         746b819f515e        1 hour ago          18.49 MB
postgres                  latest              746b819f315e        4 days ago          213.4 MB
```
Alternatif command jika kalian hanya ingin tahu apakah docker image yang terakhir kalian pull itu sudah ada atau belum kalian bisa dengan cara `docker images [REPOSITORY:TAG]`
```bash
$ docker images python:3.10-alpine
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
python                    3.10-alpine         746b819f315e        1 hour ago          18.49 MB
```

## Delete Image
Jika kalian sudah tidak menggunakan image kalian bisa delete dengan cara `docker images rm [REPOSITORY:TAG]`
```bash
$ docker image rm postgres:latest
746b819f315e
```
Otomatis langsung kedelete, selain cara itu ada alternatif lain kalian bisa juga langsung dengan cara `docker rmi [REPOSITORY:TAG]`
```bash
$ docker rmi committ:latest
b6fa739cedf5
```
Dalam docker ada namanya cache yang tersimpan ketika kalian gagal dalam pull image atau bundling sebuah image, cache makan resource maka dari itu harus dihapus. Untuk melihatnya kalian bisa dengan cara seperti ini
```bash
$ docker images --no-trunc
REPOSITORY                    TAG                 IMAGE ID                                                                  CREATED             SIZE
<none>                        <none>              sha256:77af4d6b9913e693e8d0b4b294fa62ade6054e6b2f1ffb617ac955dd63fb0182   19 hours ago        1.089 GB
```
Kalian bisa hapus image tersebut dengan menggunakan flag `-f` untuk filter untuk filtering image yang unttaged / tidak memilik tag
```bash
$ docker rmi $(docker images -f "dangling=true" -q)
77af4d6b9913
```

### Sample Usage
Kalau kalian mau mencoba kalian bisa running command yang ada diatas, atau kalian juga bisa running script `main.sh`. Sebelum di running kalian harus `chmod +x main.sh` terlebih dahulu

Jika kalian ingin pull image kalian bisa melakukan ini
```bash
./main.sh pull image
```
Kalau ingin lihat list image kalian bisa melakukan ini
```bash
./main.sh list
```
Kalau kalian ingin delete image kalian juga bisa melakukan ini
```bash
./main.sh delete image
```