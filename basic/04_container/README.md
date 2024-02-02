## Docker Container
![banner](../../.github/assets/docker-container.png)
Secara simpelnya container ialah unit yang running dari image yang digunakan. Ketika image sudah berhasil kita pull dan untuk memakai image tersebut kita harus build container terlebih dahulu. Mungkin secara gambaran halusnya, container layaknya `komputer` dan image adalah `os` nya. Setiap container yang kita buat juga memiliki id , serta kita juga bisa menamai container kita sesuka hati kita. Namun syarat dari membuat container ialah port yang kita gunakan tidak boleh digunakan oleh service lain.

## Create Container
Lalu bagaimana cara kita membuat container tersebut ? Cara membuat container sangatlah mudah kalian bisa memakai syntax `docker container create -it -dp [portPublish]:[portContainer] --name=[nama-container] [image]`. Ada beberapa flag yang mungkin terdengar asing. 

| Flag   | Description                                                   | Usage                            |
|--------|---------------------------------------------------------------|----------------------------------|
| -p     | Flag untuk menggunakan port                                   | -p [portPublish]:[portContainer] |
| --name | Untuk menamai container                                       | --name=[namaContainer]           |
| -d     | Singkatan dari detach, yang artinya running di belakang layar | -d                               |
| -i     | membuat STDIN tetep aktif walau tanpa ada inputan             | -i                               |
| -t     | TTY atau shell aktif ketika login ke container                | -t                               |

Atau kalian juga bisa running sebuah container dengan menggunakan syntax `docker run -dp [portPublish]:[portContainer] --name=[namaContainer] [image]`

```bash
$ docker pull nginx
$ docker container create -it -p 5000:80 --name=sample-container nginx
1112ba2152b163c388456696a0d99ce1a8857958cee92aa9403e9768924e10ea
```

## Start Container
Jika kalian menggunakan syntax `docker container create` maka kalian harus start terlebih dahulu container yang udah kalian buat. Cara start container kalian bisa menggunakan syntax `docker container start [namaContainer]`

```bash
$ docker container start sample-nginx
sample-nginx
```

## List Container
Setiap container kalian bisa lihat mana container yang sedang aktif dan mana container yang tidak aktif. Hal ini dilakukan agar bisa delete container yang tidak terpakai. Cara kalian untuk melihat container yang aktif atau tidak bisa dengan command `docker container ls -a` atau `docker ps -a`. 
```bash
chentaury@alpha:~$ sudo docker container ls -a
CONTAINER ID        IMAGE                           COMMAND                  CREATED             STATUS                    PORTS                    NAMES
1112ba2152b1        nginx                           "/docker-entrypoint.…"   47 seconds ago      Up 20 seconds             0.0.0.0:5000->80/tcp     sample-nginx
b0a4c8ca15bd        openseries:1.0                  "pytest"                 27 hours ago        Exited (0) 27 hours ago                            flamboyant_williamson
5a5a21eb8e68        postgres:alpine                 "docker-entrypoint.s…"   3 weeks ago         Up 6 minutes              0.0.0.0:5432->5432/tcp   postgresdb
e6d333accc7e        moby/buildkit:buildx-stable-1   "buildkitd"              5 weeks ago         Exited (1) 3 weeks ago                             buildx_buildkit_default
```
Seperti yang sudah kita pelajari setiap image, container itu punya id nya masing-masing, hal ini sebagai penanda unik untuk setiap container ataupun image. Jika kalian ingin melihat apakah sudah running apa belum kalian bisa lihat statusnya kalau `Exited` tandanya container itu tidak running sedangkan `Up` tandanya container itu udah siap nerima request

## Stop Container
Sebelum kalian ingin menghapus container kalian harus berhentikan terlebih dahulu. Jika tidak kalian `stop` maka akan nerima pesan seperti ini
```bash
$ docker rm sample-nginx
Error response from daemon: You cannot remove a running container 1112ba2152b163c388456696a0d99ce1a8857958cee92aa9403e9768924e10ea. Stop the container before attempting removal or force remove
```
Cara kalian untuk stop sebuah container kalian bisa menggunakan syntax `docker container stop [namaContainer]` 
```bash
$ docker container stop sample-nginx
sample-nginx
```

## Remove Container
Nah jika kalian sudah stop container, kalian baru bisa delete containernya dengan command `docker rm [namaContainer]`
```bash
$ docker rm sample-nginx
sample-nginx
```
