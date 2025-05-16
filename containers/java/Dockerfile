FROM debian:bullseye-slim

LABEL maintainer="Thiago de Almeida"
LABEL description="Java development environment with sdkman for Java and Maven version management for Conveyor Engine"

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

# Create a non-root user to use sdkman and add to sudoers
RUN useradd -ms /bin/bash conveyorci && \
    echo "conveyorci ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER conveyorci
WORKDIR /home/conveyorci

# SDKMAN
RUN curl -s "https://get.sdkman.io" | bash
SHELL ["/bin/bash", "-c"]

# Configure SDKMAN
RUN echo "sdkman_auto_answer=true" > /home/conveyorci/.sdkman/etc/config && \
    echo "sdkman_auto_selfupdate=false" >> /home/conveyorci/.sdkman/etc/config && \
    echo "sdkman_insecure_ssl=false" >> /home/conveyorci/.sdkman/etc/config

# Making it available for the user
RUN echo "source /home/conveyorci/.sdkman/bin/sdkman-init.sh" >> /home/conveyorci/.bashrc

# Export SDKMAN_DIR for use in GitHub Actions
ENV SDKMAN_DIR="/home/conveyorci/.sdkman"
ENV PATH="${SDKMAN_DIR}/candidates/java/current/bin:${SDKMAN_DIR}/candidates/maven/current/bin:${PATH}"

# Copy the entrypoint script
COPY --chown=conveyorci:conveyorci entrypoint.sh /home/conveyorci/entrypoint.sh
RUN chmod +x /home/conveyorci/entrypoint.sh

ENTRYPOINT ["/home/conveyorci/entrypoint.sh"]

CMD ["bash"]