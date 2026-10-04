;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services firewall)
  #:use-module (gnu services)
  #:use-module (gnu services networking)
  #:use-module (guix gexp)
  #:export (firewall-service))

(define firewall-service
  (service nftables-service-type
           (nftables-configuration
            (ruleset (local-file "../../../files/system/nftables.conf")))))
