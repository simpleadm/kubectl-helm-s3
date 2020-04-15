FROM alpine:3.11

ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="kubectl-helm-s3" \
      org.label-schema.url="https://hub.docker.com/r/simpleadm/kubectl-helm-s3/" \
      org.label-schema.vcs-url="https://github.com/simpleadm/kubectl-helm-s3" \
      org.label-schema.build-date=$BUILD_DATE

# Note: Latest version of kubectl may be found at: https://github.com/kubernetes/kubernetes/releases
ENV KUBE_LATEST_VERSION="v1.17.4"
# Note: Latest version of helm may be found at:  https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="v2.16.1"

RUN apk add --no-cache ca-certificates bash git openssh curl \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

# Install s3 helm plugin
RUN helm init --client-only && helm plugin install https://github.com/hypnoglow/helm-s3.git

CMD kubectl
