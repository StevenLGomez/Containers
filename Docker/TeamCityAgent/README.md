
## This container can be built from this directory using:  ###
`podman build --rm -t tctest:<tag> .`  

## Running The Container ##

### This starts it and gives a bash shell  
`podman run -i -t tctest:<tag> /bin/bash`

### Start container; running 'wine "C:\windows\system32\notepad.exe"' works  
`podman run -i -t --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 tctest:<tag> /bin/bash`  
`podman run --rm -it --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 tctest:0222 /bin/bash`






