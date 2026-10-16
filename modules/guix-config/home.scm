;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config home)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages xdisorg)
  #:use-module (guix-config home kitty)
  #:use-module (guix-config home niri)
  #:use-module (guix-config home portal)
  #:use-module (guix-config home sound)
  #:export (home))

(define home
  (home-environment
   (packages (append kitty-packages niri-packages portal-packages sound-packages
                     (list git just xeyes)))
   (services (append (list kitty-config-files niri-config-files portal-config-files)
                     %base-home-services))))
