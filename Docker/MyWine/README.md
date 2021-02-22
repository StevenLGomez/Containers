
### This container can be built from this directory using:  ###
`podman build --rm -t mywine:<tag> .`  

### Running the container ###

# This starts it and gives a bash shell  
`podman run -i -t mywine:<tag> /bin/bash`

# This opens notepad.exe  
`podman run --rm --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 mywine:<tag> wine "C:\windows\system32\notepad.exe"`  

# Start container; running 'wine "C:\windows\system32\notepad.exe"' works  
`podman run -i -t --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 mywine:<tag> /bin/bash`  
`podman run --rm -it --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 mywine:0222 /bin/bash`


# 2020-02-22 - Success milestone:
`cd /root/.wine/drive_c/projects/bta3d/cmod/smx/pme/csimon`  
`wine "C:\PT\opus\make.exe"`  

`~/.wine/drive_c/projects/bta3d/cmod/smx/pme/csimon# cksum obj/csimon.lib`  
`3328100808 30841 obj/csimon.lib`  
The CRC above matches the corresponding build on the XP VM.

