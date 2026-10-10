;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config kernel)
  #:use-module (gnu)
  #:use-module (srfi srfi-1)
  #:export (%kernel-arguments))

(define %kernel-arguments
  (cons* "loglevel=3"
         "nowatchdog"
         "libahci.ignore_sss=1"
         "nvidia-drm.modeset=1"
         "resume=45cbc7b4-859b-4126-9dfb-e2be0292c655"
         "fastboot"
         (remove (lambda (argument)
                   (string=? argument "quiet"))
                 %default-kernel-arguments)))
