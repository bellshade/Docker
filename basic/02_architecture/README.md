## Architecture Docker
<img src="https://docs.docker.com/get-started/images/docker-architecture.webp">

Docker memiliki skema arsitektur client-server. Docker client menggunakan docker daemon untuk melakukan proses docker seperti build image, buat container, running container, dan running service untuk proses orchestration. Docker client dan docker daemon bisa running di system yang sama atau kadang ada juga ada yang custom untuk konek ke docker daemon yang lain. Namun bagaimana semua lifecycle docker itu terjadi ? Nahh secara simpel, docker client dan docker daemon itu sebenarnya melakukan koneksi ke REST Api dari si docker untuk request ke docker registry.

Docker registry ialah tempat dimana semua image itu ada. Untuk membuat container kalian harus `pull` image dari docker hub , dari situlah lah nanti kalian bisa create container dari image yang udah kalian pull. Kurang lebih skema lifecyclenya seperti ini

<img src="https://i.ytimg.com/vi/fBHuD4gNbF8/maxresdefault.jpg">


## Docker Registry
Docker Registry ialah merupakan tempat kalian untuk catch image yang mau kalian gunakan ataupun push image yang telah kalian buat. Kalian bisa buat system registry di local kalian dengan pull image `registry` dari docker hub. Biasanya ini sering dilakukan jika aplikasi masih tahap development ataupun staging.

### Install Registry
Cara install registry di local kalian bisa dengan cara seperti ini 
```bash
docker pull registry:2
docker run -d -p 5000:5000 --restart always --name registry registry:2
```

Setelah itu kalian bisa tag `image` kalian yang udah ada, atau kalian bisa ambil dari docker hub lalu di publish di local registry kalian

```bash
docker pull alpine
docker tag alpine localhost:5000/alpine
docker push localhost:5000/alpine
```