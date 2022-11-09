
### Yocto hosting container based on:
https://boundarydevices.com/using-docker-containers-for-reproducible-yocto-builds/


#### Build using:
```
podman build -t yocto:<tag> .
```


#### Run using
```
# Standalone, with bash shell
podman run --rm -it yocto:<tag> /bin/bash
```

### To push a container image to Quay.io
```
# If this is the first push, an empty repository must be created on quay.io
# Determine the image you intend to push using:
podman images

#The local image must be retagged prior to being pushed to Quay.io (tag as 9.20.2-001)
podman tag localhost/bxarm-9.20.2:<tag> quay.io/gesllc/bxarm:<tag>

# Log in to Quay.io  User name gesllc   Password <classified>
podman login quay.io

# After successful login, push the image
podman push quay.io/gesllc/yocto:<tag>
```


