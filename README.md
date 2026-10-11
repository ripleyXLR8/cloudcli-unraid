# cloudcli-unraid

Claude Code on an Unraid host, two ways in:

- **[CloudCLI](https://github.com/siteboon/claudecodeui)** web UI on port 3001 (chat, real terminal with the full `claude` TUI, files, git).
- **Claude Code Remote Control** server, so sessions can be started from claude.ai/code or the Claude app.

The container is privileged, shares the host PID namespace and mounts `/` at `/host`. Claude can run anything on the host with `nsenter -t 1 -a -- <cmd>`. **Keep it on the LAN.**

## First run
1. Open `http://<server>:3001`, create the CloudCLI account.
2. In its terminal: `cd /host/mnt/user && claude`, `/login`, accept the folder trust, then `/remote-control` once to enable it.
3. Remote Control starts by itself within 30 s of the login.

Python projects: `python3 -m venv .venv` in the project (python3-venv and the Playwright Chromium system libraries are in the image; browsers go to /root/.cache).

Update: bump `CLOUDCLI_VERSION` in `dockerfile` and push.
