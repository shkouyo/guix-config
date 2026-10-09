;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config home)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages version-control)
  #:use-module (guix-config home kitty)
  #:use-module (guix-config home niri)
  #:export (home))

(define home
  (home-environment
   (packages (append kitty-packages niri-packages (list git just)))
   (services (append (list kitty-config-files niri-config-files)
                     %base-home-services))))
