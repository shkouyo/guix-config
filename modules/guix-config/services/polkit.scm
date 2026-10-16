;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services polkit)
  #:use-module (gnu services)
  #:use-module (gnu services dbus)
  #:use-module (gnu services desktop)
  #:export (%polkit-services))

(define %polkit-services
  (list (service polkit-service-type)
        polkit-wheel-service
        (service rtkit-service-type)))
