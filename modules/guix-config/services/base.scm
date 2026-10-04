;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services base)
  #:use-module (gnu packages fonts)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (guix gexp)
  #:export (%base-services*))

(define %terminus-v16b
  (file-append font-terminus "/share/consolefonts/ter-v16b"))

(define %base-services*
  (modify-services %base-services
    (console-font-service-type fonts =>
      (map (lambda (font)
             (cons (car font) %terminus-v16b))
           fonts))
    (login-service-type config =>
      (login-configuration
       (inherit config)
       (motd (plain-file "motd" ""))))))
