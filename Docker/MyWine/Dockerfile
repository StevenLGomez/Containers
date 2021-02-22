
FROM docker.io/strm/debian32

RUN dpkg --add-architecture i386
RUN apt-get update

# Install wine32 & wine(64 bit)
RUN apt-get install --no-install-recommends --assume-yes wine32
RUN apt-get install --no-install-recommends --assume-yes wine

# Install common applications
RUN apt-get install -y git
RUN apt-get install -y subversion
RUN apt-get install -y python3.4

# The following environment variable is probably required to run wine successfully ??
ENV DISPLAY :0

# Run a wine command that doesn't require parameters to initialize the Pseudo Windows file system
RUN /usr/bin/wine "C:\windows\system32\hostname.exe"

# After running the command above, the default i386 file system should exist as
# /root/.wine/drive_c
#
# Create the "Legacy" directory heirarchy of build tools as C:\PT
# from a previously seeded local directory tree (/opt/PT)

COPY ./PT /root/.wine/drive_c/PT

# And a static copy of source code for testing prior to connecting to TeamCity
COPY ./bta3d /root/.wine/drive_c/projects/bta3d

# The following Environment Variable is required for Opus Make (will not run without it)
ENV COMSPEC "C:\WINDOWS\system32\cmd.exe"

# Environment Variables for standard build process
ENV PTOOLS "C:\PT"
#ENV PATH "C:\PT\opus;C:\PT\bmx\bin;C:\PT\tasm40\bin"

ENV PY27 /usr/bin/python3.4

