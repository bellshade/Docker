## Manage Resource

Secara default docker sendiri telah membuat system semakin flexibel. Dimana kalian bisa mengatur resource sesuai yang kalian butuhkan. Namun ini termasuk kompleks, karena jika salah manage yang terjadi adalah app yang sudah kita bundling tidak akan bekerja dengan semestinya. Ada beberapa hal yang harus kamu ketahui untuk manage resource yang diperlukan

### **_CPU_**
| flag               | desckripsi                                                                                              |
|--------------------|---------------------------------------------------------------------------------------------------------|
| `--cpus`             | _flag ini digunakan untuk mengatur resource cpu_                                                          |
| `--cpu-period`       | _flag yang digunakan untuk mengatur resource dari maximal waktu process_                                  |
| `--cpu-quota`        | _flag ini digunakan untuk mengatur cpu sebelum menyentuh batas maximal dari period yang telah disetup_    |
| `--cpu-rt-runtime`   | _flag yang digunakan untuk mengatur batas maximal untuk proses runtime dari docker daemon per second-nya_ |
| `--cap-add=sys_nice` | _ini sering digunakan untuk mengatur proses runtime cpu agar berjalan secara stabil_                      |

Beberapa flag diatas sering digunakan untuk management sebuah cpu. Hal ini dilakukan jika ada suatu service yang tidak memerlukan nilai cpu yang tinggi dan dengan ini otomatis bisa dialokasikan ke service yang membutuhkan resource cpu yang besar seperti message broker, concurency program, dsb . Kalian bebas mau mengatur resource memory by command ketika buat container atau di `docker-compose` nya. Misal kita ambil contoh aja disini, kita punya CPU 1 dan untuk service `nginx` kita butuh cuma `30%` saja

```
$ docker run -it --cpus=".3" sample-image /bin/bash
```
Kalau dalam docker composenya kalian bisa tambahkan statement `deploy` dan `limits` untuk mengatur resource yang ada

```yml
# version untuk saat ini ialah version 3.9 
# untuk installasi kalian bisa jalanin saja script di root folder ini `install.sh`
version: '3.9'
# services define apa saja yang akan dilakukan build 
# bahkan sampai pembuatan container dan running juga
services:

  # ini adalah service webapp, kalian bebas custom sesuai keinginan kalian
  webapp:

    # build syntax yang digunakan untuk building Dockerfile yang kita punya
    build: 
      context: .
      dockerfile: dockerfile

    # deploy syntax yang disetup ketika lagi dalam proses deployment
    deploy:
      # resources statement digunakan untuk mengatur limit terhadap container yang kita gunakan
      resources:
        # nah disini pointnya, yang kita mau manage ada disini
        # seperti manage cpu dengan 30% dari yang kita miliki
        # resource memory yang ingin kita gunakan 
        limits:
          cpus: '0.3'
          memory: 200m
          pids: 1

    # nama container , sebenarnya biar mudah saja di kelola
    # karena secara default docker sudah membuat nama container secara otomatis
    container_name: webapp
    
    # publisher port yang dimana ini akan digunakan untuk lient akses ke container kita
    # port yang image bisa kalian baca di official docsnya
    ports:
      - 4000:80
    
```

### **_Memory_**
Selain dari CPU kita juga bisa mengatur memory sesuai yang akan kita gunakan. Resource memory digunakan untuk aplikasi yang membutuhkan lebih banyak, seperti service yang berhubungan dengan data. Ada beberapa flag yang sering digunakan untuk mengatur resource memory

| flag                   | desckripsi                                                                                                      |
|------------------------|-----------------------------------------------------------------------------------------------------------------|
| `-m or --memory`       | _flag ini digunakan untuk mengatur resource memory yang ingin dipakai, default satuanya adalah megabyte_        |
| `--memory-swap`        | _manage resource yang digunakan untuk mengatur memory swap_                                                     |
| `--memory-reservation` | _soft limiter dengan kata lain ini digunakan untuk mengatur memory yang lebih rendah dari statement `--memory`_ |
| `--kernel-memory`      | _manage resource dari kernel yang memiliki batas minimal 6m_                                                    |

Kalian bisa mengatur resource baik melewati command ketika build container ataupun didalam docker-compose nya. 

```
$ docker run --rm -d -p 3000:8080 -m 500m --name=sample-container webapp
```
Untuk sample contoh di docker-compose kalian bisa liat di [contoh](docker-compose.yml) atau di atas juga ada 