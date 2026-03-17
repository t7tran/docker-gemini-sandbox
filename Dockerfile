FROM us-docker.pkg.dev/gemini-code-dev/gemini-cli/sandbox:0.33.2

USER root

RUN apt-get update && \
    # install common utilities
    curl -fsSLo /usr/local/bin/yq https://github.com/mikefarah/yq/releases/download/v4.52.2/yq_linux_amd64 && \
    chmod +x /usr/local/bin/yq && \
    curl -fsSLo /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.8.1/jq-linux64 && \
    chmod +x /usr/local/bin/jq && \
    # install playwright for testing
    npx -y playwright@1.58.2 install-deps && \
    npx -y playwright@1.58.2 install chrome && \
    # clean up
    rm -rf /var/lib/apt/lists/*

USER node
