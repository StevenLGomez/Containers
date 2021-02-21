
This container can be built from this directory using:  
`podman build --rm -t mywine:<tag> .`  

It can be run using:  
`podman run -i -t mywine:<tag> /bin/bash`          # This starts it and gives a bash shell  
`podman run --rm --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 mywine:<tag> wine "C:\windows\system32\notepad.exe"`  # This opens notepad.exe  
`podman run -i -t --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 mywine:<tag> /bin/bash`  # Starts it, and running 'wine "C:\windows\system32\notepad.exe"' works  

