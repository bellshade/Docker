# Disini kita memakai base image dari python versi 3.12
# Kalau kalian ingin ubah versinya sesuai local kalian boleh juga
# Base image usahakan harus sama dengan local version kita 
# agar tidak terjadinya fault depedency
FROM python:3.12

# Setup default value dari variabel maintainer :u
ARG USER_GITHUB=rulanugrh

# Label untuk information dari image yang akan dibuat
LABEL maintainer=${USER_GITHUB}
LABEL organization="Bellshade"

# Custom work directory ketika spawn terminal
WORKDIR /web

# COPY semua yang ad didalam local ke dalam image
COPY . .

# RUN untuk installing package yang dibutuhkan 
RUN pip3 install flask

# EXPORT port yang siap digunakan oleh public
EXPOSE 8080

# CMD value ketika container running
CMD ["python3", "main.py"]