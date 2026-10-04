;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config keyboard)
  #:use-module (gnu system keyboard)
  #:export (%keyboard-layout))

(define %keyboard-layout
  (keyboard-layout "us"))
