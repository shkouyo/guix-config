;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services elogind)
  #:use-module (gnu services)
  #:use-module (gnu services desktop)
  #:export (elogind-service))

(define elogind-service
  (service elogind-service-type
           (elogind-configuration
            (handle-power-key 'ignore))))
