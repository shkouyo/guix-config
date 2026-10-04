# -*- mode: just; -*-
#
# Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
# SPDX-License-Identifier: AGPL-3.0-or-later

update:
	guix pull -C channels.scm

system-build:
	guix system build -L modules systems/system.scm

system: _guard
	sudo -E XDG_CACHE_HOME=/root/.cache "$(command -v guix)" system reconfigure systems/system.scm

system-restore generation:
	#!/usr/bin/env bash
	set -euo pipefail
	generation="/var/guix/profiles/system-{{generation}}-link"
	if [ ! -e "$generation" ]; then
	    echo "error: no such generation: $generation" >&2
	    exit 1
	fi
	guix pull -C "$generation/channels.scm"
	sudo -E XDG_CACHE_HOME=/root/.cache "$(command -v guix)" system reconfigure --allow-downgrades "$generation/configuration.scm"

home-build:
	guix home build -L modules homes/home.scm

home: _guard
	guix home reconfigure homes/home.scm

home-restore generation:
	#!/usr/bin/env bash
	set -euo pipefail
	generation="/var/guix/profiles/per-user/$(id -un)/guix-home-{{generation}}-link"
	if [ ! -e "$generation" ]; then
	    echo "error: no such generation: $generation" >&2
	    exit 1
	fi
	guix pull -C "$generation/channels.scm"
	guix home reconfigure --allow-downgrades "$generation/configuration.scm"

gc:
	sudo -E XDG_CACHE_HOME=/root/.cache "$(command -v guix)" gc -d 1m -F 5G

_guard:
	#!/usr/bin/env bash
	set -euo pipefail
	if [ -n "$(git status --porcelain)" ]; then
	    echo "error: dirty working tree" >&2
	    exit 1
	fi
	head="$(git rev-parse HEAD)"
	channels="$(guix describe -f channels)"
	if ! grep -qF "$head" <<<"$channels"; then
	    echo "error: HEAD is not the pulled guix-config commit" >&2
	    exit 1
	fi
