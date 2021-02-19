
Creating Local Image Repository
https://www.techrepublic.com/article/how-to-set-up-a-local-image-repository-with-podman/

As root:  
`mkdir -p /var/lib/registry`  
`sudo podman run --privileged -d --name registry -p 5000:5000 -v /var/lib/registry:/var/lib/registry --restart=always registry:2`  
`vi /etc/containers/registries.conf`  
Change line containing: `registries = []` to `registries = ['localhost:5000']`
`systemctl restart podman`  

Example of how to push an image to the local registry:
`podman pull hello-world`  
`podman tag docker.io/library/hello-world localhost:5000/hello-world`  
`podman push localhost:5000/hello-world`
`podman images`  should now show hello-world listed in localhost:5000

Included debian32 in local repository using (after podman image rm ALL IMAGES):
`podman pull docker.io/strm/debian32`  
`podman tag docker.io/strm/debian32 localhost:5000/debian32`
`podman push localhost:5000/debian32`
