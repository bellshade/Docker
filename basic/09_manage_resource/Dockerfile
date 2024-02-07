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