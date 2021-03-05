#!/bin/bash

# Script borrowed from GetXpArtifacts.bat (in bta3d repository) to pull XP artifacts
# from the TeamCity server into directory locations expected by a complete build.
# NOTE this is a workaround hack to deal with XP specific build tools.

#BUILD_ID is mined from TeamCity REST API, and will need to be updated if XP artifacts change.
BUILD_ID=11887
BASE_URL=http://10.17.20.10:8111/app/rest/builds/id:${BUILD_ID}/artifacts/content

ARTIFACT_DIR=BacTArtifacts

if [ -z "$1" ] || [ -z "$2" ]
then
    echo BacTAlert3D Artifact Retrieval Script
    echo
    echo Usage:
    echo Must provide TeamCity credentials as follows...
    echo $0 User.Name Password 
    echo 
    exit
fi

# Remove previous ${ARTIFACT_DIR} tree to avoid duplcating files by adding a 1
rm -Rf ${ARTIFACT_DIR}

# Build the rather complicated wget command string
CMD_1='wget --no-verbose --user='$1 
CMD_2=' --password='$2
CMD_3=' '

WGET_CMD=${CMD_1}${CMD_2}${CMD_3}${BASE_URL}
echo ${WGET_CMD}

# Files that must be copied into cmod/obj/
${WGET_CMD}/BIOS.OBJ --directory-prefix=${ARTIFACT_DIR}/cmod/obj/
${WGET_CMD}/DOSEMU32.OBJ --directory-prefix=${ARTIFACT_DIR}/cmod/obj/
${WGET_CMD}/INTWRAP.OBJ --directory-prefix=${ARTIFACT_DIR}/cmod/obj/
${WGET_CMD}/PCIX86A.OBJ --directory-prefix=${ARTIFACT_DIR}/cmod/obj/
${WGET_CMD}/SEGF.OBJ --directory-prefix=${ARTIFACT_DIR}/cmod/obj/
${WGET_CMD}/STARTF.OBJ --directory-prefix=${ARTIFACT_DIR}/cmod/obj/
${WGET_CMD}/TRAPA.OBJ --directory-prefix=${ARTIFACT_DIR}/cmod/obj/
${WGET_CMD}/VGABIO32.OBJ --directory-prefix=${ARTIFACT_DIR}/cmod/obj/

# File for cmod/metagrph/lib
${WGET_CMD}/met_XB3L.LIB --directory-prefix=${ARTIFACT_DIR}/cmod/metagrph/lib

# File for cmod/smx/pme
${WGET_CMD}/PME32.EXE --directory-prefix=${ARTIFACT_DIR}/cmod/smx/pme

# Files for cmod/smx/xsmx/obj & cmod/smx/xusb/obj
${WGET_CMD}/smx.lib --directory-prefix=${ARTIFACT_DIR}/cmod/smx/xsmx/obj
${WGET_CMD}/usb.lib --directory-prefix=${ARTIFACT_DIR}/cmod/smx/xusb/obj


