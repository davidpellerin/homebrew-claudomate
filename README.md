# claudomate

Claude Code automation for any repo. Run scheduled AI tasks via launchd.

## Install

```bash
brew tap davidpellerin/claudomate
brew install claudomate
```

## Usage

```bash
cd your-repo
claudomate install
```

Edit `HEARTBEAT.md` to customize your automations.

To change how often the heartbeat runs, edit `claudomate/launchd/*.heartbeat.plist` and update the `StartCalendarInterval` minutes (the default runs at :00, :15, :30, and :45). Then reload:

```bash
./claudomate/launchd/unload.sh && ./claudomate/launchd/load.sh
```

## launchd helpers

Each repo gets a `claudomate/launchd/` directory with utility scripts:

| Script | What it does |
|---|---|
| `load.sh` | Register and start all claudomate launchd jobs |
| `unload.sh` | Stop and deregister all jobs (plists stay on disk) |
| `remove.sh` | Remove all jobs from the launchd system by label (plists stay on disk) |
| `status.sh` | Show whether each job is running, loaded-but-idle, or not registered |

Run `status.sh` any time you want a quick overview:

```bash
./claudomate/launchd/status.sh
# running (pid 1234): com.claudomate.yourrepo.heartbeat
```
