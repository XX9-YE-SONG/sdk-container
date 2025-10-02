# Containerfile (using UBI 9 minimal from Docker Hub)
FROM redhat/ubi9-minimal:latest

# Install only cmake and gcc, then clean up
RUN microdnf -y update \
    && microdnf -y install --setopt=install_weak_deps=0 \
       gcc \
       cmake\
    && microdnf clean all

WORKDIR /workspace
