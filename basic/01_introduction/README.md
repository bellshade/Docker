## Docker
<div align="center">
    <img src="https://tech.osteel.me/images/2020/03/04/docker-introduction-01.jpg">
</div>
Selamat datang di Repository Docker. Disini kalian dapat mempelajari perihal docker

### Gambaran Singkat Tentang Docker
Docker merupakan salah satu container tools yang sangat populer saat ini. Docker kerap kali digunakan untuk wrapping aplikasi yang sudah kita buat. Namun apa si sebenarnya itu `docker` ? Lalu apa kegunaanya `docker` itu sendiri.

Sebelum lanjut, kalian tahu baremetal server ?. Sebelum tenarnya cloud dulu baremetal server sering sekali digunakan untuk production. Secara simpel baremetal server ialah server yang harus kalian lakukan sendiri untuk proses installasinya, baik pemasangan rack server, storage server, ip public, dns server, dan sebagainya. Lalu bagaimana proses untuk publish aplikasi yang sudah kita punya ?. Nah untuk mempublishnya ini kalian harus punya dulu `Virtualization Manager` seperti proxmox setelah itu baru install operating system yang ingin digunakan baik itu ubuntu ataupun centos. Nah didalam virtualisasi itulah kalian bisa install package yang dibutuhkan untuk mendukung server kalian seperti bind9, web server, mail server, monitoring, ftp server, dependecy aplikasi, dan masih banyak lagi.

<div align="center">
    <img src="https://linkserve.global/website/wp-content/uploads/2020/10/what-is-server-virtualization.png">
</div>

Lalu apa perbedaanya dengan `Docker`? Perbedaan dengan docker ialah jika `virtualization` berarti operating sytem berjalan diatas `virtualization`. Namun jika docker systemnya berjalan diatas `operating system` . Secara simpelnya docker running didalam sebuah `operating system`
<div align="center">
    <img src="https://mjaglan.github.io/images/docker-virtualbox/docker-vs-vm.png">
</div>

### Keuntungan Docker
Keuntungan docker sendiri membuat source code yang masih memiliki versi lama itu bisa dipisah atau di wrap dengan `Dockerfile` ini memudahkan developer ketika ada legacy project yang harus di rewrite. Dengan seperti meminimalisir waktu untuk maintenance program yang sudah ada.

Berbeda dengan tidak pakai docker , source code yang sudah tertera di server mau gamau harus dirombak total, belum lagi jika dalam sebuah aplikasi ada plugin yang hanya support di version tertentu. Maka dari itu docker adalah solusi untuk wrapping aplikasi tanpa obrak abrik server.

### Sample Usage
```bash
docker run bellshade/hello-bellshade
```