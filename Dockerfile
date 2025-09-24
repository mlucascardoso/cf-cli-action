FROM debian:bullseye-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    ca-certificates \
    jq \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install Cloud Foundry CLI v8 (latest stable)
RUN curl -fsSL "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github" | tar -zxC /usr/local/bin \
    && chmod +x /usr/local/bin/cf*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]