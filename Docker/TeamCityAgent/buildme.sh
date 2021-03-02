
# --rm    Removes intermediate containers after a successful build (default true)
#  -t     --tag name    Tagged name to apply to the built image

podman build --rm -t agent:0302 .
