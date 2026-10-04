;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services network)
  #:use-module (gnu services)
  #:use-module (gnu services networking)
  #:export (%network-services))

(define %network-services
  (list (service network-manager-service-type)
        (service wpa-supplicant-service-type)))
