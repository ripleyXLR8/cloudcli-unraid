# Running on the Unraid host

You are in a privileged container sharing the host's PID namespace.

- The host's root filesystem is mounted at `/host` (shares under `/host/mnt/user`, flash under `/host/boot`).
- To run a command **on the host** (docker, Unraid tools, services): `nsenter -t 1 -a -- <command>`.
  Example: `nsenter -t 1 -a -- docker ps`.
- Everything runs as root on the host: confirm before anything destructive.
