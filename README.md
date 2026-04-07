# claudomate

Claude Code automation for any repo. Run scheduled AI tasks via launchd.

## Why claudomate?

- **No API costs** — automations run through Claude Code directly, leveraging your existing Anthropic subscription instead of making API calls
- **Terms of Service compliant** — interacts with Claude Code the same way a human would, via tmux keystrokes
- **No `/loop` time limits** — bypasses the 3-day limitation of Claude Code's built-in `/loop` command
- **Full control over input** — customize exactly what gets typed into Claude Code, including `/new` to reset context and reduce token usage
- **Battle-tested transport** — built on tmux, a well-established terminal multiplexer
- **Repo-scoped tasks** — each repo defines its own `HEARTBEAT.md` with the automations that matter for that project

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
