;; -*- mode: scheme; -*-
;;
;; Copyright (C) 2026 ShinKouyo <i@0x0f.dev>
;; SPDX-License-Identifier: AGPL-3.0-or-later

(define-module (guix-config home niri)
  #:use-module (gnu home services)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages window-management)
  #:use-module (gnu packages xorg)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:export (niri-packages
            niri-config-files))

(define niri-packages
  (list niri xwayland-satellite dbus))

(define niri-config-files
  (simple-service 'niri-config-files
                  home-xdg-configuration-files-service-type
                  (list (list "niri/config.kdl"
                              (local-file "../../../files/dotfiles/niri/config.kdl")))))
