# -*- mode: just; -*-
#
# Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
# SPDX-License-Identifier: AGPL-3.0-or-later

update:
	guix pull -C channels.scm

build:
	guix system build -L modules systems/system.scm

system:
	#!/usr/bin/env bash
	set -euo pipefail
	if [ -n "$(git status --porcelain)" ]; then
	    echo "error: dirty working tree" >&2
	    exit 1
	fi
	head="$(git rev-parse HEAD)"
	if ! guix describe -f channels | grep -qF "$head"; then
	    echo "error: HEAD is not the pulled guix-config commit" >&2
	    exit 1
	fi
	sudo -E XDG_CACHE_HOME=/root/.cache "$(command -v guix)" system reconfigure systems/system.scm

restore generation:
	#!/usr/bin/env bash
	set -euo pipefail
	generation="/var/guix/profiles/system-{{generation}}-link"
	if [ ! -e "$generation" ]; then
	    echo "error: no such generation: $generation" >&2
	    exit 1
	fi
	guix pull -C "$generation/channels.scm"
	sudo -E XDG_CACHE_HOME=/root/.cache "$(command -v guix)" system reconfigure "$generation/configuration.scm"

gc:
	guix gc -d 1m -F 5G
