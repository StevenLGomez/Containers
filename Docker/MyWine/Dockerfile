
# FROM localhost:5000/debian32
FROM docker.io/strm/debian32

RUN dpkg --add-architecture i386
RUN apt-get update

RUN apt-get install --no-install-recommends --assume-yes wine32
RUN apt-get install --no-install-recommends --assume-yes wine

RUN apt-get install -y git
RUN apt-get install -y subversion

ENV DISPLAY :0

