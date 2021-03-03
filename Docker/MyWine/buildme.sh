
# --rm    Removes intermediate containers after a successful build (default true)
#  -t     --tag name    Tagged name to apply to the built image

CONT_NAME=wine
CONT_TAG=$(date +%m%d)

echo Starting build of Container: ${CONT_NAME}:${CONT_TAG}

podman build --rm -t ${CONT_NAME}:${CONT_TAG} .

echo Container build complete: ${CONT_NAME}:${CONT_TAG}

