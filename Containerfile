# Containerfile (fixed to use a valid UBI 9 base tag)
FROM registry.access.redhat.com/ubi9/ubi:9

# Install only cmake and gcc, then clean up
RUN dnf -y update \
    && dnf -y install --setopt=install_weak_deps=False \
       cmake \
       gcc \
    && dnf clean all \
    && rm -rf /var/cache/dnf

WORKDIR /workspace
