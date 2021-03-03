
#
#    --ip 10.17.20.150                                  \
#    Error: invalid config provided: rootless containers and pods cannot be assigned static IP addresses
#
#    --hostname podagent-01                             \
#    hostname seems to have been updated, but TC agent couldn't read it to set agent name
#    Will try setting it during the build (but it will be static :( )
#    Dockerfile now includes a sed command to force the hostname used by TeamCity
#

CONT_NAME=wine
CONT_TAG=$(date +%m%d)

podman run         \
    --rm                                               \
    --interactive                                      \
    --tty                                              \
    --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0       \
    ${CONT_NAME}:${CONT_TAG} /bin/bash

# podman run --rm -it --volume /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 mywine:0222 /bin/bash

