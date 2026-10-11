#!/bin/sh
set -e

# /root is a volume: the Claude CLI lives there so its self-updates survive recreation.
[ -x /root/.local/bin/claude ] || curl -fsSL https://claude.ai/install.sh | bash
mkdir -p /root/.claude
[ -f /root/.claude/CLAUDE.md ] || cp /opt/CLAUDE.md /root/.claude/CLAUDE.md

# Remote Control server for claude.ai/code and the mobile app, once logged in.
tmux new -d -s rc "until [ -f /root/.claude/.credentials.json ]; do sleep 30; done; \
  cd '$RC_DIR'; while true; do claude remote-control --remote-control-session-name-prefix unraid; sleep 15; done"

exec cloudcli start --port "$SERVER_PORT"
