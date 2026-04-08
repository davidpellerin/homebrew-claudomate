# claudomate

Claude Code automation for any repo. Run scheduled AI tasks via launchd or cron.

## Why claudomate?

- **No API costs** — automations run through Claude Code directly, leveraging your existing Anthropic subscription instead of making API calls
- **Terms of Service compliant** — interacts with Claude Code the same way a human would, via tmux keystrokes
- **No `/loop` time limits** — bypasses the 3-day limitation of Claude Code's built-in `/loop` command
- **Full control over input** — customize exactly what gets typed into Claude Code, including `/new` to reset context and reduce token usage
- **Battle-tested transport** — built on tmux, a well-established terminal multiplexer
- **Repo-scoped tasks** — each repo defines its own `HEARTBEAT.md` with the automations that matter for that project

## Install

**macOS (Homebrew):**

```bash
brew tap davidpellerin/claudomate
brew install claudomate
```

**Linux (or manual install):**

```bash
git clone https://github.com/davidpellerin/homebrew-claudomate.git
cd homebrew-claudomate
make install   # installs to ~/.local by default
```

Make sure `~/.local/bin` is in your `PATH`. To uninstall:

```bash
make uninstall
```

You can install to a different prefix with `make install PREFIX=/usr/local`.

## Usage

```bash
cd your-repo
claudomate install launchd   # or: claudomate install cron
```

Edit `HEARTBEAT.md` to customize your automations.

To uninstall:

```bash
claudomate uninstall launchd   # or: claudomate uninstall cron
```

## launchd helpers

When using `launchd`, each repo gets a `claudomate/launchd/` directory with utility scripts:

| Script | What it does |
|---|---|
| `load.sh` | Register and start all claudomate launchd jobs |
| `unload.sh` | Stop and deregister all jobs (plists stay on disk) |
| `remove.sh` | Remove all jobs from the launchd system by label (plists stay on disk) |
| `status.sh` | Show whether each job is running, loaded-but-idle, or not registered |

To change how often the heartbeat runs, edit `claudomate/launchd/*.heartbeat.plist` and update the `StartCalendarInterval` minutes (the default runs at :00, :15, :30, and :45). Then reload:

```bash
./claudomate/launchd/unload.sh && ./claudomate/launchd/load.sh
```

Run `status.sh` any time you want a quick overview:

```bash
./claudomate/launchd/status.sh
# running (pid 1234): com.claudomate.yourrepo.heartbeat
```

## cron helpers

When using `cron`, each repo gets a `claudomate/cron/` directory with utility scripts:

| Script | What it does |
|---|---|
| `install.sh` | Add the heartbeat cron job (runs every 15 minutes) |
| `remove.sh` | Remove the heartbeat cron job |
| `status.sh` | Show whether the cron job is currently installed |
