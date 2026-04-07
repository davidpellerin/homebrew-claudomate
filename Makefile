.PHONY: help lint install uninstall

PREFIX ?= $(HOME)/.local

help: ## Show this help message
	@echo "Usage: make <target>"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*##' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "  %-15s %s\n", $$1, $$2}'

lint: ## Run shellcheck on bin/claudomate
	shellcheck bin/claudomate

install: ## Install claudomate to PREFIX (default: $(PREFIX))
	install -Dm755 bin/claudomate $(PREFIX)/share/claudomate/bin/claudomate
	install -Dm644 templates/HEARTBEAT.md $(PREFIX)/share/claudomate/templates/HEARTBEAT.md
	install -Dm644 templates/scripts/start.sh $(PREFIX)/share/claudomate/templates/scripts/start.sh
	install -Dm644 templates/scripts/heartbeat.sh $(PREFIX)/share/claudomate/templates/scripts/heartbeat.sh
	install -Dm644 templates/launchd/install.sh $(PREFIX)/share/claudomate/templates/launchd/install.sh
	mkdir -p $(PREFIX)/bin
	ln -sf $(PREFIX)/share/claudomate/bin/claudomate $(PREFIX)/bin/claudomate
	@echo "Installed claudomate → $(PREFIX)/bin/claudomate"
	@echo "Make sure $(PREFIX)/bin is in your PATH"

uninstall: ## Remove claudomate from PREFIX
	rm -f $(PREFIX)/bin/claudomate
	rm -rf $(PREFIX)/share/claudomate
	@echo "Uninstalled claudomate from $(PREFIX)"
