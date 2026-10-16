;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config home sound)
  #:use-module (gnu packages linux)
  #:export (sound-packages))

(define sound-packages
  (list pipewire wireplumber))
