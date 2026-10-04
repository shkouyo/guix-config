;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services ssh)
  #:use-module (gnu services)
  #:use-module (gnu services ssh)
  #:export (ssh-service))

(define ssh-service
  (service openssh-service-type
           (openssh-configuration
            (port-number 22604))))
