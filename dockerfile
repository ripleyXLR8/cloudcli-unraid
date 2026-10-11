FROM node:22-bookworm-slim

# Pinned on purpose: bump it here and push, never update from the UI.
ARG CLOUDCLI_VERSION=1.37.4

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates curl git tmux util-linux procps jq ripgrep less openssh-client \
      build-essential python3 python3-setuptools \
 && npm install -g --no-audit --no-fund @cloudcli-ai/cloudcli@${CLOUDCLI_VERSION} \
 && cloudcli --version \
 && apt-get purge -y build-essential python3-setuptools && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/* /root/.npm

ENV PATH=/root/.local/bin:$PATH \
    SERVER_PORT=3001 \
    WORKSPACES_ROOT=/host/mnt/user \
    RC_DIR=/host/mnt/user

COPY entrypoint.sh /entrypoint.sh
COPY CLAUDE.md /opt/CLAUDE.md
RUN chmod +x /entrypoint.sh

EXPOSE 3001
ENTRYPOINT ["/entrypoint.sh"]
