;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config services base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages shells)
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
       (motd (plain-file "motd" ""))))
    (special-files-service-type files =>
      (cons `("/bin/bash" ,(file-append bash "/bin/bash"))
            (map (lambda (file)
                   (if (string=? (car file) "/bin/sh")
                       `("/bin/sh" ,(file-append dash "/bin/dash"))
                       file))
                 files)))))
