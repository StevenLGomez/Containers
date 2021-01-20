
FROM debian:latest
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install --no-install-recommends --assume-yes wine
RUN apt-get install --no-install-recommends --assume-yes wine32
ENV DISPLAY :0
