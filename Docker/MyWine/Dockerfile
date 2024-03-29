
FROM debian:buster

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get upgrade -y

# Install common applications
RUN apt-get install -y git
RUN apt-get install -y subversion
RUN apt-get install -y python2.7
RUN apt-get install -y nasm

# Install wine32 
RUN apt-get install --no-install-recommends --assume-yes wine32
# Install wine (64 bit)
RUN apt-get install --no-install-recommends --assume-yes wine

ENV WINEARCH=win32
ENV WINEPREFIX=/root/.wine
RUN wineboot

# Install DOSBox (needed for tasmx.exe, as reported by WINE & WINE32)
# RUN apt-get install -y dosbox

# The following environment variable is required for GUI applications with wine
ENV DISPLAY :0

# Create a directory that can be mapped as C:\tmp, and make it writable
RUN mkdir /root/.wine/drive_c/tmp
RUN chmod 777 /root/.wine/drive_c/tmp

# Copy a seeded HKEY_CURRENT_USER registry mimic file (user.reg, seeded with PATH information)
COPY ./user.reg /root/.wine/user.reg

# Populate the Windows file system created above with  the "Legacy" directory heirarchy 
# of build tools as C:\PT from a previously seeded local directory tree (./PT)
COPY ./PT /root/.wine/drive_c/PT
#COPY ./PT /root/PT

# Create a (temporary) static copy of source code for testing prior to connecting to TeamCity
COPY ./bta3d /root/.wine/drive_c/projects/bta3d

# Copy the 'impossible' artifacts into the directory tree copied above
COPY ./BacTArtifacts /root/.wine/drive_c/projects/bta3d

# The following Environment Variable is required for Opus Make (will not run without it)
ENV COMSPEC "C:\WINDOWS\system32\cmd.exe"

# Environment Variables for standard build process
ENV PTOOLS "C:\PT"
ENV PY27 /usr/bin/python2.7
#ENV PATH "C:\PT\opus;C:\PT\bmx\bin;C:\PT\tasm40\bin"


