# Docker System
![banner](../../.github/assets/docker-system.png)

Docker system merupakan command yang digunakan untuk memanagement docker itu sendiri. Terkadang jika kita gagal dalam build image banyak cache yang telah terkumpul. Maka dari itu agar tidak tertumpuk dalam satu server dan mengurangi space server itu sendiri, docker ada command tersendiri untuk menghapus itu semua yaitu `docker system`. Ada beberapa sintaks yang bisa kamu ketahui untuk `docker system` itu sendiri, ialah

| flag   | description                                                                                                         |
|--------|---------------------------------------------------------------------------------------------------------------------|
| info   | docker system info digunakan untuk display docker itu sendiri ada beberapa informasi yang bisa kamu dapatkan disini |
| df     | flag yang digunakan untuk melihat size disk yang telah digunakan                                                    |
| events | flag yang digunakan untuk mendapatkan data server tentang penggunaan docker                                         |
| prune  | flag yang digunakan untuk delete cache di server                                                                    |

## Docker Info
Docker info digunakan untuk melihat tentang info dari server tersebut. Berisi container yang kita gunakan, image yang kita pull, server version, containerd version, dan sebagainya. Bahkan size memory server kita juga, kernel version, bahkan jumlah cpu yang digunakan di server kita. Cara kalian tahu informasi ini, kalian bisa menjalani command ini
```console
$ docker system info
Containers: 2
 Running: 2
 Paused: 0
 Stopped: 0
Images: 26
Server Version: 18.09.1
Storage Driver: overlay2
 Backing Filesystem: extfs
 Supports d_type: true
 Native Overlay Diff: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host macvlan null overlay
 Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
root@alpha:~# docker system info
Containers: 2
 Running: 2
 Paused: 0
 Stopped: 0
Images: 26
Server Version: 18.09.1
Storage Driver: overlay2
 Backing Filesystem: extfs
 Supports d_type: true
 Native Overlay Diff: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host macvlan null overlay
 Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
containerd version: 9754871865f7fe2f4e74d43e2fc7ccd237edcbce
runc version: 1.0.0~rc6+dfsg1-3
init version: v0.18.0 (expected: fec3683b971d9c3ef73f284f176672c44b448662)
Security Options:
 apparmor
 seccomp
  Profile: default
Kernel Version: 4.19.0-10-amd64
Operating System: Debian GNU/Linux 10 (buster)
OSType: linux
Architecture: x86_64
CPUs: 2
Total Memory: 1.925GiB
Name: alpha
ID: MB2B:BUYD:NKI7:VUET:D5EH:VUJ6:NSHA:GMFR:QNNT:A2VW:2JXP:QN4S
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): false
Registry: https://index.docker.io/v1/
Labels:
Experimental: false
Insecure Registries:
 127.0.0.0/8
Live Restore Enabled: false

WARNING: No swap limit support
```

## Docker Disk Free
Docker Disk Free alias docker df, ialah command yang digunakan untuk melihat space yang telah kita gunakan. Ini berisi image yang kita gunakan, container yang kita buat. Kalian bisa melihat space yang digunakan per-image dan tiap container yang ada dengan cara 

```
$ docker system df -v
Images space usage:

REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE                SHARED SIZE         UNIQUE SIZE         CONTAINERS
testing-image          latest              271b7cd85b5c        44 minutes ago      471MB               451MB               19.99MB             1
sample-image-2         latest              6bdbd5d04355        2 days ago          7.377MB             7.377MB             0B                  0
openseries             1.0                 b588d56d417c        3 days ago          163.9MB             51.65MB             112.2MB             0
alpine                 3.19.1              05455a08881e        6 days ago          7.377MB             7.377MB             0B                  0

Containers space usage:

CONTAINER ID        IMAGE               COMMAND                  LOCAL VOLUMES       SIZE                CREATED             STATUS              NAMES
233df9fb0ae3        testing-image       "docker-php-entrypoi…"   0                   2B                  44 minutes ago      Up 44 minutes       loving_ptolemy
```

## Docker Prune
Docker system prune digunakan untuk menghapus cache data, dari semua system yang ada baik container, image, network, volume, dan sebagainya. Kalian bisa gunakan ini dengan cara seperti ini

```
$ docker system prune
WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all dangling images
        - all dangling build cache
Are you sure you want to continue? [y/N] y
```
