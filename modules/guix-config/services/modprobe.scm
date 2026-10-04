;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services modprobe)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:export (modprobe-service))

(define modprobe-service
  (simple-service 'modprobe-blacklist etc-service-type
                  (list `("modprobe.d/blacklist.conf"
                          ,(local-file "../../../files/system/modprobe.d/blacklist.conf")))))
