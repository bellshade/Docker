FROM python:3.12

WORKDIR /web

COPY . .
RUN pip3 install flask

EXPOSE 8080
CMD ["python3", "main.py"]