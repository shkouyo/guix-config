;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services x11)
  #:use-module (gnu services)
  #:use-module (gnu services desktop)
  #:export (x11-service))

(define x11-service
  (service x11-socket-directory-service-type))
