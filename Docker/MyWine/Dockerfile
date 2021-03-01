
#FROM docker.io/strm/debian32
FROM debian:buster

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get upgrade -y

# Install common applications
RUN apt-get install -y git
RUN apt-get install -y subversion
RUN apt-get install -y python2.7
RUN apt-get install -y nasm

# Install wine32 & wine(64 bit)
RUN apt-get install --no-install-recommends --assume-yes wine32
RUN apt-get install --no-install-recommends --assume-yes wine

# Install DOSBox (needed for tasmx.exe, as reported by WINE & WINE32)
RUN apt-get install -y dosbox

# The following environment variable is probably required to run wine successfully ??
ENV DISPLAY :0

# Run a wine command that doesn't require parameters to initialize the Pseudo Windows file system
# After running this command, the default i386 file system should exist as
# /root/.wine/drive_c
RUN /usr/bin/wine "C:\windows\system32\hostname.exe"

# Populate the Windows file system created above with  the "Legacy" directory heirarchy 
# of build tools as C:\PT from a previously seeded local directory tree (./PT)
COPY ./PT /root/.wine/drive_c/PT

# And a (temporary) static copy of source code for testing prior to connecting to TeamCity
COPY ./bta3d /root/.wine/drive_c/projects/bta3d

# The following Environment Variable is required for Opus Make (will not run without it)
ENV COMSPEC "C:\WINDOWS\system32\cmd.exe"

# Environment Variables for standard build process
ENV PTOOLS "C:\PT"
ENV PY27 /usr/bin/python2.7
#ENV PATH "C:\PT\opus;C:\PT\bmx\bin;C:\PT\tasm40\bin"


