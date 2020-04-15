# Docker image with Kubectl and Helm with s3 plugin

[![](https://images.microbadger.com/badges/image/simpleadm/kubectl-helm-s3.svg)](https://microbadger.com/images/simpleadm/kubectl-helm-s3 "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/simpleadm/kubectl-helm-s3.svg)](https://microbadger.com/images/simpleadm/kubectl-helm-s3 "Get your own version badge on microbadger.com")

[![Docker build](http://dockeri.co/image/simpleadm/kubectl-helm-s3)](https://hub.docker.com/r/simpleadm/kubectl-helm-s3/)


This docker image provides kubectl and helm binaries for working with a Kubernetes cluster.

## Run

Example to just run helm on entry:  
`docker run --rm simpleadm/kubectl-helm-s3 helm`  
By default kubectl will try to use /root/.kube/config file for connection to the kubernetes cluster, but does not exist by default in the image.

Example for use with personal administration or troubleshooting with volume mount for kubeconfig files:  
`docker run -it -v ~/.kube:/root/.kube simpleadm/kubectl-helm-s3`  
The -v maps your host docker machine Kubernetes configuration directory (~/.kube) to the container's Kubernetes configuration directory (root/.kube).

## Credits
Inspired by https://github.com/dtzar/helm-kubectl
