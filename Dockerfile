# Use Alpine Linux to avoid Docker Hub rate limiting
FROM alpine:3.18

# Install dependencies
RUN apk add --no-cache \
    ca-certificates \
    jq \
    curl \
    wget \
    bash

# Install Cloud Foundry CLI v8 (latest stable)
RUN curl -fsSL "https://packages.cloudfoundry.org/stable?release=linux64-binary&version=v8&source=github" | tar -zxC /usr/local/bin \
    && chmod +x /usr/local/bin/cf*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]