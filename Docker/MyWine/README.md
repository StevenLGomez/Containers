
## This container can be built from this directory using:  ###
`podman build --rm -t mywine:<tag> .`  

## Running The Container ##

### This starts it and gives a bash shell  
`podman run -i -t mywine:<tag> /bin/bash`

### This opens notepad.exe  
`podman run --rm --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 mywine:<tag> wine "C:\windows\system32\notepad.exe"`  

### Start container; running 'wine "C:\windows\system32\notepad.exe"' works  
`podman run -i -t --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 mywine:<tag> /bin/bash`  
`podman run --rm -it --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 mywine:0222 /bin/bash`


### 2021-02-22 - Success milestone:
`cd /root/.wine/drive_c/projects/bta3d/cmod/smx/pme/csimon`  
`wine "C:\PT\opus\make.exe"`  

`~/.wine/drive_c/projects/bta3d/cmod/smx/pme/csimon# cksum obj/csimon.lib`  
`3328100808 30841 obj/csimon.lib`  
The CRC above matches the corresponding build on the XP VM.

### 2021-02-24 - Created build heirarchy diagram (Visio)  
- Test ran subprojects in W10 to identify build failures.  
- Started search for build failures in WINE & WINE32.  
- Encountered various failures likely due to PATH not being set in WINE Environment.  
- Encountered hard failure with tasmx.exe (WINE reports: You should install DOSBox).   
- Dockerfile has been updated to install DOSBox; running:
    `/usr/bin/dosbox /root/.wine/drive_c/PT/tasm40/BIN/TASMX.EXE`  
- displays the tasm.exe help information.  
- Will need to work out how to run DOSBox in a script (to exit to shell without interaction).

### 2021-03-04 - Container environment variables
- From `https://wiki.winehq.org/Wine_Uer's_Guide#Environment_variables`  
- `wine regedit`  
- Search for PATH in HKEY\_CURRENT\_USER/Environment  
- Add `"Path" = "c:\\windows;c:\\windows\\system;c:\\PT\bmx\bin ...."`  
- Need to figure out how to create script to automate this in builds


