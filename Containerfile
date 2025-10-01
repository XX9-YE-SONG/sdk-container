# Containerfile
FROM registry.access.redhat.com/ubi9/ubi-minimal:9

# Install only cmake and gcc, then clean up
RUN microdnf -y update \
    && microdnf -y install --setopt=install_weak_deps=0 \
       cmake \
       gcc \
    && microdnf clean all

WORKDIR /workspace
