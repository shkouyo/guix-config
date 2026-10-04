;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services ntp)
  #:use-module (gnu services)
  #:use-module (gnu services networking)
  #:export (ntp-service))

(define ntp-service
  (service ntp-service-type))
