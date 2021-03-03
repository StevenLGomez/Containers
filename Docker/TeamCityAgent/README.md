
## This container can be built from this directory using:  ###
`podman build --rm -t agent:<tag> .`  

## Running The Container ##

### This starts it and gives a bash shell  
`podman run -i -t agent:<tag> /bin/bash`

### Start container; running 'wine "C:\windows\system32\notepad.exe"' works  
`podman run -i -t --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 agent:<tag> /bin/bash`  
`podman run --rm -it --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 agent:0222 /bin/bash`

## 2021-03-02 - Added scripts to project to build and run this container; use the scripts instead of entering by hand as above.






