;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services dbus)
  #:use-module (gnu services)
  #:use-module (gnu services dbus)
  #:export (dbus-service))

(define dbus-service
  (service dbus-root-service-type))
