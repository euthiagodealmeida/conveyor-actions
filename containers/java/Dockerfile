FROM debian:bullseye-slim

LABEL maintainer="Thiago de Almeida"
LABEL description="Java development environment with sdkman for Java and Maven version management for GitHub Actions"

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install minimal dependencies required for sdkman and Java
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
    zip \
    bash \
    git \
    procps \
    fontconfig \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create conveyorci user for local testing/debugging, but we'll use root for GitHub Actions
RUN useradd -ms /bin/bash conveyorci && \
    echo "conveyorci ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# SDKMAN
RUN curl -s "https://get.sdkman.io" | bash
SHELL ["/bin/bash", "-c"]
# Configure SDKMAN
RUN echo "sdkman_auto_answer=true" > /root/.sdkman/etc/config && \
    echo "sdkman_auto_selfupdate=false" >> /root/.sdkman/etc/config && \
    echo "sdkman_insecure_ssl=false" >> /root/.sdkman/etc/config
# Making it available for root user
RUN echo "source /root/.sdkman/bin/sdkman-init.sh" >> /root/.bashrc

# Export SDKMAN_DIR for use in GitHub Actions
ENV SDKMAN_DIR="/root/.sdkman"
ENV PATH="${SDKMAN_DIR}/candidates/java/current/bin:${SDKMAN_DIR}/candidates/maven/current/bin:${PATH}"

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]