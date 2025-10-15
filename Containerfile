# Use a lightweight base image
FROM ubuntu:24.04

# Avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update and install gcc and cmake
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
         make \
         gcc \
        cmake && \
    rm -rf /var/lib/apt/lists/*

# Set default shell
SHELL ["/bin/bash", "-c"]

# Optional: set a working directory
WORKDIR /workspace

# Default command
CMD ["bash"]
