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
                              (local-file "../../../files/dotfiles/niri/config.kdl"))
                        (list "niri/input.kdl"
                              (local-file "../../../files/dotfiles/niri/input.kdl"))
                        (list "niri/outputs.kdl"
                              (local-file "../../../files/dotfiles/niri/outputs.kdl"))
                        (list "niri/layout.kdl"
                              (local-file "../../../files/dotfiles/niri/layout.kdl"))
                        (list "niri/misc.kdl"
                              (local-file "../../../files/dotfiles/niri/misc.kdl"))
                        (list "niri/binds.kdl"
                              (local-file "../../../files/dotfiles/niri/binds.kdl")))))
